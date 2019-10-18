module RedisSnippets
  module SnippetsHelper
    include RedisSnippets::Util

    # Return true if snippet has content.
    def snippet_has_content?(key)
      !SnippetStoreService.send(snippet_key(key)).blank?
    end

    def snippet(key, classes = nil)
      SnippetPresenter.new(view: self, key: key, classes: classes).call
    end
  end
end
