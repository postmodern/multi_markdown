require 'spec_helper'

describe MultiMarkdown do
  context "with kramdown" do
    let(:library)  { :kramdown            }
    let(:constant) { 'Kramdown::Document' }

    describe "find" do
      before { require 'kramdown' }

      it "should find the Kramdown::Document" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find Kramdown::Document" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
