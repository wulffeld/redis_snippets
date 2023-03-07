require 'rails_helper'

describe RedisSnippets::SnippetsHelper, type: :helper do
  let(:code) { "<p>Buy this from Amazon.</p>" }
  let(:view) { ActionController::Base.new.view_context }

  describe "#snippet_has_content?" do
    before do
      SnippetStoreService.update(snippet_key(:advert_header), code)
    end

    it "returns true if there's content in the snippet" do
      expect(snippet_has_content?(:advert_header)).to be true
    end

    it "returns false if there's no content in the snippet" do
      expect(snippet_has_content?(:advert_footer)).to be false
    end
  end

  describe "#snippet" do
    before do
      SnippetStoreService.update(snippet_key(:advert_header), code)
    end

    it "adds the snippet key as the class" do
      expect(snippet(:advert_header)).to eq("<div class=\"snippet advert_header\"><p>Buy this from Amazon.</p></div>")
    end

    it "adds more classes from a string" do
      expect(snippet(:advert_header, "advert-responsive")).to eq("<div class=\"snippet advert_header advert-responsive\"><p>Buy this from Amazon.</p></div>")
    end

    it "adds more classes from an array" do
      expect(snippet(:advert_header, ["advert-responsive", "p-4"])).to eq("<div class=\"snippet advert_header advert-responsive p-4\"><p>Buy this from Amazon.</p></div>")
    end
  end
end
