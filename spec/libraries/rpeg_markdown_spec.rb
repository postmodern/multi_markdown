require 'spec_helper'

describe MultiMarkdown do
  context "with rpeg_markdown" do
    let(:library)  { :rpeg_markdown }
    let(:constant) { 'PEGMarkdown'  }

    describe "find" do
      before { require 'peg_markdown' }

      it "should find the PEGMarkdown" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find PEGMarkdown" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
