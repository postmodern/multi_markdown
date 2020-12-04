require 'spec_helper'

describe MultiMarkdown do
  context "with rdiscount" do
    let(:library)  { :rdiscount  }
    let(:constant) { 'RDiscount' }

    describe "find" do
      before { require 'rdiscount' }

      it "should find the RDiscount" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find RDiscount" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
