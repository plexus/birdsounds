require 'spec_helper'

describe "birdsounds/edit" do
  before(:each) do
    @birdsound = assign(:birdsound, stub_model(Birdsound))
  end

  it "renders the edit birdsound form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => birdsounds_path(@birdsound), :method => "post" do
    end
  end
end
