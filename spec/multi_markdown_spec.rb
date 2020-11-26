require 'spec_helper'
require 'multi_markdown'

describe MultiMarkdown do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end

  describe "find" do
    it "should raise an ArgumentError for unknown libraries" do
      expect {
        subject.find(:foo)
      }.to raise_error(ArgumentError)
    end

    it "should raise a NameError when the library could not be found" do
      expect {
        subject.find(:kramdown)
      }.to raise_error(NameError)
    end
  end

  describe "use" do
    it "should raise an ArgumentError for unknown libraries" do
      expect {
        subject.use(:foo)
      }.to raise_error(ArgumentError)
    end

    it "should raise a LoadError when the library could not be found" do
      expect {
        subject.use(:kramdown)
      }.to raise_error(LoadError)
    end
  end

  describe "load" do
    before { Bundler.setup(:rdiscount, :kramdown, :redcarpet) }

    it "should load the first available library" do
      expect(subject.load.name).to be == subject::CONSTANTS[:redcarpet]
    end
  end
end
