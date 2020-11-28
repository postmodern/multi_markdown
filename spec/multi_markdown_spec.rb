require 'spec_helper'
require 'multi_markdown'

describe MultiMarkdown do
  before(:all) do
    $LOAD_PATH.reject! { |path| path =~ /kramdown/ }
  end

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
      before { Bundler.setup(:kramdown) }

      it do
        expect {
          subject.find(:maruku)
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
          subject.use(:kramdown)
        }.to raise_error(LoadError)
      end
    end
  end

  describe "load" do
    before(:all) do
      $LOAD_PATH.reject! { |path| path =~ /redcarpet/ }
    end

    it "should load the first available library" do
      expect(subject.load.name).to be == subject::CONSTANTS[:rdiscount]
    end
  end
end
