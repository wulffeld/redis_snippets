module RedisSnippets
  module SnippetsHelper
    include RedisSnippets::Help

    def snippet_content(snippet_name)
      RedisSnippets::Snippets.send(snippet_key(snippet_name))
    end

    # Return true if snippet has content.
    def snippet_has_content?(snippet_name)
      !snippet_content(snippet_name).blank?
    end

    def snippet(snippet_name, classes = nil)
      return '' if controller.status == 404
      snippet = snippet_content(snippet_name)
      return '' if snippet.blank?
      snippets = snippet.split("[section]")
      build_snippet(snippets[rand(snippets.length)], snippet_class_list(snippet_name, classes))
    end

    def snippet_class_list(snippet_name, classes = nil)
      [
        'snippet',
        snippet_name.to_s,
        *classes
      ].reject(&:blank?).join(' ').html_safe
    end

    def build_snippet(content, classes)
      content_tag(:div, content.html_safe, class: classes)
    end
  end
end
