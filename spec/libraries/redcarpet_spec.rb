require 'spec_helper'

describe MultiMarkdown do
  context "with redcarpet" do
    let(:library)  { :redcarpet        }
    let(:constant) { 'RedcarpetCompat' }

    describe "find" do
      before { require 'redcarpet' }

      it "should find the RedcarpetCompat" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find RedcarpetCompat" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
