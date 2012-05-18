require 'spec_helper'

describe MultiMarkdown do
  context "with rpeg_markdown" do
    let(:library)  { :rpeg_markdown }
    let(:constant) { 'PEGMarkdown'  }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'peg_markdown' }

      it "should find the PEGMarkdown" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find PEGMarkdown" do
        subject.use(library).name.should == constant
      end
    end
  end
end
