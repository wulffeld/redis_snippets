class SnippetPresenter
  include RedisSnippets::Util

  def initialize(view:, key:, snippet:, classes: nil)
    @view = view
    @key = key
    @snippet = snippet
    @classes = classes
  end

  def call
    prepare_snippet
    render
  end

  protected

  def prepare_snippet
    return unless transform_class&.transforms?(key: @key)

    @snippet = transform_class.new(content: @snippet, key: @key).transform
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
    return "" if @snippet.blank?

    @view.content_tag(:div, @snippet.html_safe, class: snippet_class_list)
  end

  def transform_class
    @klass ||=
      if RedisSnippets::Engine.config.redis_snippets[:transform].is_a?(Proc)
        klass = RedisSnippets::Engine.config.redis_snippets[:transform].call and klass.constantize
      else
        RedisSnippets::Engine.config.redis_snippets[:transform] and RedisSnippets::Engine.config.redis_snippets[:transform].constantize
      end
  end
end
