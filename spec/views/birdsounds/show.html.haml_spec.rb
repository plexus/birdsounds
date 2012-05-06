require 'spec_helper'

describe "birdsounds/show" do
  before(:each) do
    @birdsound = assign(:birdsound, stub_model(Birdsound))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
