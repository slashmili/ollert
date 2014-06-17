require "test_helper"

describe Card do
  let(:card) { Card.new }

  it "must be valid" do
    card.must_be :valid?
  end
end
