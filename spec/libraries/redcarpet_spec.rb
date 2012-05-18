require 'spec_helper'

describe MultiMarkdown do
  context "with redcarpet" do
    let(:library)  { :redcarpet        }
    let(:constant) { 'RedcarpetCompat' }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'redcarpet' }

      it "should find the RedcarpetCompat" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find RedcarpetCompat" do
        subject.use(library).name.should == constant
      end
    end
  end
end
