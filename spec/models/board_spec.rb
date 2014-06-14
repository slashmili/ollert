require 'rails_helper'

describe Board, :type => :model do
  it "shouldn't save a board with the same name" do
    Board.create!(:title => "Foo")
    expect { Board.create!(:title => "Foo") }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
