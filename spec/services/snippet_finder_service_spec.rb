require 'rails_helper'

describe SnippetFinderService do
  let(:code) { "<p>Buy this from Amazon.</p>" }
  let(:multiple_adverts) { <<-HEREDOC
<p>Buy this from Amazon.</p>
[section]
<p>Buy this from Apple.</p>
HEREDOC
  }
  let(:view) { ActionController::Base.new.view_context }

  subject { described_class.new(key: :advert_header).call }

  describe "#call" do
    before do
      SnippetStoreService.update(snippet_key(:advert_header), code)
    end

    it "finds the content" do
      expect(subject).to eq(code)
    end
  end

  describe ".random_snippet" do
    before do
      SnippetStoreService.update(snippet_key(:advert_header), multiple_adverts)
    end

    it "returns one of the sections" do
      expect(described_class).to receive(:rand).and_return(0)
      expect(described_class.random_snippet(multiple_adverts)).to eq("<p>Buy this from Amazon.</p>\n")
    end
  end
end
