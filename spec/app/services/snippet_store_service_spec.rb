require 'rails_helper'

describe SnippetStoreService do
  let(:defined_key) { SnippetStoreService.advert_header }

  let(:code) { "<p>Hello world.</p>" }

  describe "#update" do
    it "updates the content of a snippet" do
      SnippetStoreService.update(snippet_key(:advert_header), code)

      expect(SnippetStoreService.advert_header).to eq(code)
    end

    it "doesn't allowed undefined keys" do
      expect { SnippetStoreService.update(:advert_sidebar, code) }.to raise_error(UndefinedSnippetsKey)
    end
  end

  describe "#del" do
    it "removes the content of a snippet" do
      SnippetStoreService.update(snippet_key(:advert_header), code)
      SnippetStoreService.del(snippet_key(:advert_header))

      expect(SnippetStoreService.advert_header).to eq(nil)
    end
  end

  describe "#method_missing" do
    it "delegates missing methods to the store" do
      SnippetStoreService.update(snippet_key(:advert_header), code)

      expect(SnippetStoreService.advert_header).to eq(code)
    end

    it "returns nil for defined keys that has not been set" do
      expect(defined_key).to eq(nil)
    end

    it "returns nil for undefined keys" do
      expect(SnippetStoreService.advert_sidebar).to eq(nil)
    end
  end
end
