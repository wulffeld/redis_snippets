class SnippetFinderService
  include RedisSnippets::Util

  SECTION_DELIMITER = "[section]"

  def initialize(key:)
    @key = key
  end

  def call
    self.class.random_snippet(SnippetStoreService.send(snippet_key(@key)))
  end

  protected

  class << self
    def random_snippet(content)
      return "" if content.blank?

      snippets = content.split("#{SECTION_DELIMITER}").map { |section| section.gsub(/^\n/, "") }
      snippets[rand(snippets.length)]
    end
  end
end
