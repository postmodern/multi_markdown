require 'spec_helper'
require 'multi_markdown'

describe MultiMarkdown do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  describe "find" do
    it "should raise an ArgumentError for unknown libraries" do
      lambda {
        subject.find(:foo)
      }.should raise_error(ArgumentError)
    end

    it "should raise a NameError when the library could not be found" do
      lambda {
        subject.find(:kramdown)
      }.should raise_error(NameError)
    end
  end

  describe "use" do
    it "should raise an ArgumentError for unknown libraries" do
      lambda {
        subject.use(:foo)
      }.should raise_error(ArgumentError)
    end

    it "should raise a LoadError when the library could not be found" do
      lambda {
        subject.use(:kramdown)
      }.should raise_error(LoadError)
    end
  end

  describe "load" do
    before { Bundler.setup(:rdiscount, :kramdown, :redcarpet) }

    it "should load the first available library" do
      subject.load.name.should == subject::CONSTANTS[:redcarpet]
    end
  end
end
