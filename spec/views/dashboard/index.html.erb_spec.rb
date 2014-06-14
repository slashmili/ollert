require 'rails_helper'

describe "root", :type => :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        :title => "title"
      ),
      Board.create!(
        :title => "title2"
      )
    ])
  end

  it "renders the dasboard with a list of boards" do
    pending "Don't know how to test the root route!"
    render
    assert_select "tr>td", :text => "title".to_s, :count => 0
  end
end
