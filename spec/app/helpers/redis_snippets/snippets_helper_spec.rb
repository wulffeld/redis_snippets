require 'rails_helper'

describe "RedisSnippets::SnippetsHelper", type: :helper do
  let(:code) { "<p>Hello world.</p>" }

  describe "#snippet_content" do
    before do
      RedisSnippets::Snippets.update(snippet_key(:advert_header), code)
    end

    it "returns the content" do
      expect(snippet_content(:advert_header)).to eq(code)
    end
  end

  describe "#snippet_has_content?" do
    before do
      RedisSnippets::Snippets.update(snippet_key(:advert_header), code)
    end

    it "returns true if there's content in the snippet" do
      expect(snippet_has_content?(:advert_header)).to be true
    end

    it "returns false if there's no content in the snippet" do
      expect(snippet_has_content?(:advert_footer)).to be false
    end
  end

  describe "#snippet_class_list" do
    it "adds the snippet key as the class" do
      expect(snippet_class_list(:advert_header)).to eq("snippet advert_header")
    end

    it "adds more classes from a string" do
      expect(snippet_class_list(:advert_header, "advert-responsive")).to eq("snippet advert_header advert-responsive")
    end

    it "adds more classes from an array" do
      expect(snippet_class_list(:advert_header, ["advert-responsive", "p-4"])).to eq("snippet advert_header advert-responsive p-4")
    end
  end
end
