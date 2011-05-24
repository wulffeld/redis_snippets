module RedisSnippets
  module SnippetsHelper
    def snippet_content(snippet_name)
      RedisSnippets::Snippets.send(snippet_name)
    end
    
    # Return true if snippet has content.
    def snippet_has_content?(snippet_name)
      !RedisSnippets::Snippets.send(snippet_name).blank?
    end
    
    def snippet(snippet_name, classes=nil)
      return '' if controller.status == 404
      content = snippet_content(snippet_name)
      return '' if content.blank?
      build_snippet(content, snippet_class_list(snippet_name, classes))
    end

    def snippet_class_list(snippet_name, classes)
      ['snippet', classes || snippet_name.to_s].compact.join(' ').html_safe
    end

    def build_snippet(content, classes)
      content_tag(:div,
        content.html_safe,
        :class => classes)
    end
  end
end
