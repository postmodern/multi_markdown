require 'spec_helper'

describe MultiMarkdown do
  context "with rdiscount" do
    let(:library)  { :rdiscount  }
    let(:constant) { 'RDiscount' }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'rdiscount' }

      it "should find the RDiscount" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find RDiscount" do
        subject.use(library).name.should == constant
      end
    end
  end
end
