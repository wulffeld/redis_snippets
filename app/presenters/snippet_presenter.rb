
class SnippetPresenter
  include RedisSnippets::Util

  SECTION_DELIMITER = "[section]"

  delegate :random_snippet, to: "self.class"

  def initialize(view:, key:, classes: nil)
    @view = view
    @key = key
    @classes = classes
  end

  def call
    prepare_snippet
    render
  end

  protected

  def prepare_snippet
    @snippet = ""

    return unless content = SnippetStoreService.send(snippet_key(@key))

    snippets = content.split("#{SECTION_DELIMITER}")
    @snippet = random_snippet(content)

    if transform_class && transform_class.transforms?(key: @key)
      @snippet = transform_class.new(content: @snippet, key: @key).transform
    end
  end

  def snippet_class_list
    [
      "snippet",
      @key.to_s,
      *@classes
    ].reject(&:blank?).join(" ").html_safe
  end

  def render
    # If snippet is empty we avoid wrapping it in the div.
    if @snippet.blank?
      ""
    else
      @view.content_tag(:div, @snippet.html_safe, class: snippet_class_list)
    end
  end

  def transform_class
    @klass ||=
      if RedisSnippets::Engine.config.redis_snippets[:transform].is_a?(Proc)
        klass = RedisSnippets::Engine.config.redis_snippets[:transform].call and klass.constantize
      else
        RedisSnippets::Engine.config.redis_snippets[:transform] and RedisSnippets::Engine.config.redis_snippets[:transform].constantize
      end
  end

  class << self
    def random_snippet(content)
      snippets = content.split("#{SECTION_DELIMITER}").map { |section| section.gsub(/^\n/, "") }
      snippets[rand(snippets.length)]
    end
  end
end
