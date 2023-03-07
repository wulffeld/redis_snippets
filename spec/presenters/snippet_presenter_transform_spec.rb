require 'rails_helper'

class Transformer
  def initialize(content:, key:)
    @content = content
    @key = key
  end

  # Must return content.
  def transform
    @content.gsub("Amazon", "Etsy")
  end

  class << self
    def transforms?(key:)
      key == :advert_header
    end
  end
end

describe SnippetPresenter do
  describe "with a transform class" do
    let(:code) { "<p>Buy this from Amazon.</p>" }
    let(:view) { ActionController::Base.new.view_context }

    subject(:header_finder) { described_class.new(view: view, key: :advert_header, snippet: code) }
    subject(:footer_finder) { described_class.new(view: view, key: :advert_footer, snippet: code) }

    describe "#call" do
      before do
        ENV["TRANSFORM"] = "1"
        SnippetStoreService.update(snippet_key(:advert_header), code)
        SnippetStoreService.update(snippet_key(:advert_footer), code)
      end

      it "transforms the content" do
        expect(header_finder.call).to eq("<div class=\"snippet advert_header\"><p>Buy this from Etsy.</p></div>")
      end

      it "does not transform the content if key is not allowed" do
        expect(footer_finder.call).to eq("<div class=\"snippet advert_footer\"><p>Buy this from Amazon.</p></div>")
      end
    end
  end
end
