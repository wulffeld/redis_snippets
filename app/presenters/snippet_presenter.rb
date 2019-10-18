
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

    if content = SnippetStoreService.send(snippet_key(@key))
      snippets = content.split("#{SECTION_DELIMITER}")
      @snippet = random_snippet(content)
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

  class << self
    def random_snippet(content)
      snippets = content.split("#{SECTION_DELIMITER}").map { |section| section.gsub(/^\n/, "") }
      snippets[rand(snippets.length)]
    end
  end
end
