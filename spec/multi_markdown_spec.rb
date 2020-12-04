require 'spec_helper'
require 'multi_markdown'

describe MultiMarkdown do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end

  describe "find" do
    context "when the library is unknown" do
      it do
        expect {
          subject.find(:foo)
        }.to raise_error(ArgumentError)
      end
    end

    context "when the library constant cannot be found" do
      it do
        expect {
          subject.find(:redcarpet)
        }.to raise_error(NameError)
      end
    end
  end

  describe "use" do
    context "when the library is unknown" do
      it do
        expect {
          subject.use(:foo)
        }.to raise_error(ArgumentError)
      end
    end

    context "when the library cannot be required" do
      it do
        expect {
          subject.use(:redcarpet)
        }.to raise_error(LoadError)
      end
    end
  end

  describe "load" do
    it "should load the first available library" do
      expect(subject.load.name).to be == subject::CONSTANTS[:kramdown]
    end
  end
end
