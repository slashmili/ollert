require 'rails_helper'

describe Board, :type => :model do
  it "shouldn't save a board with the same name" do
    Board.create!(:title => "Foo")
    expect { Board.create!(:title => "Foo") }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should create 3 list immediately after creation of new board", type: :model do
    board_with_3_lists = Board.create!(:title => "Foo with 3 boards")
    expect(board_with_3_lists.list.count).to eq(3)
  end
end
