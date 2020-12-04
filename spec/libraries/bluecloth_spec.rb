require 'spec_helper'

describe MultiMarkdown do
  context "with bluecloth" do
    let(:library)  { :bluecloth  }
    let(:constant) { 'BlueCloth' }

    describe "find" do
      before { require 'bluecloth' }

      it "should find the BlueCloth" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find BlueCloth" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
