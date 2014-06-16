require 'rails_helper'

RSpec.describe "lists/new", :type => :view do
  before(:each) do
    assign(:list, List.new(
      :title => "MyString",
      :board_id => 1
    ))
  end

  it "renders new list form" do
    render

    assert_select "form[action=?][method=?]", lists_path, "post" do

      assert_select "input#list_title[name=?]", "list[title]"

      assert_select "input#list_board_id[name=?]", "list[board_id]"
    end
  end
end
