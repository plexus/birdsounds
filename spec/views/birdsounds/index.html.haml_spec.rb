require 'spec_helper'

describe "birdsounds/index" do
  before(:each) do
    assign(:birdsounds, [
      stub_model(Birdsound),
      stub_model(Birdsound)
    ])
  end

  it "renders a list of birdsounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
