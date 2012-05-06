require 'spec_helper'

describe "birdsounds/new" do
  before(:each) do
    assign(:birdsound, stub_model(Birdsound).as_new_record)
  end

  it "renders new birdsound form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => birdsounds_path, :method => "post" do
    end
  end
end
