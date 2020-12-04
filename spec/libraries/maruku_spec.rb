require 'spec_helper'

describe MultiMarkdown do
  context "with maruku" do
    let(:library)  { :maruku  }
    let(:constant) { 'Maruku' }

    describe "find" do
      before { require 'maruku' }

      it "should find the Maruku" do
        expect(subject.find(library).name).to be == constant
      end
    end

    describe "use" do
      it "should load and find Maruku" do
        expect(subject.use(library).name).to be == constant
      end
    end
  end
end
