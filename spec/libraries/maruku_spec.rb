require 'spec_helper'

describe MultiMarkdown do
  context "with maruku" do
    let(:library)  { :maruku  }
    let(:constant) { 'Maruku' }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'maruku' }

      it "should find the Maruku" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find Maruku" do
        subject.use(library).name.should == constant
      end
    end
  end
end
