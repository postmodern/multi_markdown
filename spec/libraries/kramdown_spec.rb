require 'spec_helper'

describe MultiMarkdown do
  context "with kramdown" do
    let(:library)  { :kramdown            }
    let(:constant) { 'Kramdown::Document' }

    before { Bundler.setup(library) }

    describe "find" do
      before { require 'kramdown' }

      it "should find the Kramdown::Document" do
        subject.find(library).name.should == constant
      end
    end

    describe "use" do
      it "should load and find Kramdown::Document" do
        subject.use(library).name.should == constant
      end
    end
  end
end
