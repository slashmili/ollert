require 'rails_helper'

RSpec.describe "boards/index", :type => :view do
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

  it "renders a list of boards" do
    render
    assert_select "tr>td", :text => "title".to_s, :count => 1
  end
end
