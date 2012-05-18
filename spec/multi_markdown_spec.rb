require 'spec_helper'
require 'multi_markdown'

describe MultiMarkdown do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
