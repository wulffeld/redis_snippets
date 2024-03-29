require 'rails_helper'

describe SnippetPresenter do
  let(:code) { "<p>Buy this from Amazon.</p>" }
  let(:multiple_adverts) { <<-HEREDOC
<p>Buy this from Amazon.</p>
[section]
<p>Buy this from Apple.</p>
HEREDOC
  }
  let(:view) { ActionController::Base.new.view_context }

  subject(:presenter) { described_class.new(view: view, key: :advert_header, snippet: code) }
  subject(:presenter_with_string_class) { described_class.new(view: view, key: :advert_header, snippet: code, classes: "advert-responsive") }
  subject(:presenter_with_array_classes) { described_class.new(view: view, key: :advert_header, snippet: code, classes: ["advert-responsive", "p-4"]) }

  describe "#call" do
    before do
      SnippetStoreService.update(snippet_key(:advert_header), code)
    end

    it "renders the content" do
      expect(presenter.call).to eq("<div class=\"snippet advert_header\">#{code}</div>")
    end

    describe "classes argument" do
      it "adds the snippet key as the class" do
        expect(presenter.call).to eq("<div class=\"snippet advert_header\"><p>Buy this from Amazon.</p></div>")
      end

      it "adds more classes from a string" do
        expect(presenter_with_string_class.call).to eq("<div class=\"snippet advert_header advert-responsive\"><p>Buy this from Amazon.</p></div>")
      end

      it "adds more classes from an array" do
        expect(presenter_with_array_classes.call).to eq("<div class=\"snippet advert_header advert-responsive p-4\"><p>Buy this from Amazon.</p></div>")
      end
    end
  end
end
