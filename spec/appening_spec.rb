require 'spec_helper'

describe Appening do
  it "responds to comments" do
    Appening.new.should respond_to(:comments) 
  end
end
