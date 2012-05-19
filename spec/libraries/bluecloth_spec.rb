require 'spec_helper'

describe MultiMarkdown do
  context "with bluecloth" do
    let(:library)  { :bluecloth  }
    let(:constant) { 'BlueCloth' }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'bluecloth' }

      it "should find the BlueCloth" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find BlueCloth" do
        subject.use(library).name.should == constant
      end
    end
  end
end
