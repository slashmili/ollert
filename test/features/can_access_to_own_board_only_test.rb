require "test_helper"

feature "CanAccessToOwnBoardOnly" do
  include Warden::Test::Helpers
  background do
    @alice = create(:user, email: "alice@example.org")
    @alice_board = create_board_for(@alice)
    @bob = create(:user, email: "bob@example.org")
    @bob_board = create_board_for(@bob)

  end

  def create_board_for(user)
    create(:board, user: user, title: user.email)
  end

  scenario "Alice only should see her own board", js: true do
    login_as @alice, :scope => :user
    visit root_path
    assert page.has_content?("alice@example.org"), "Alice should be able to see her board."
    assert page.has_no_content?("bob@example.org"), "Alice shouldn't be able to see bob's board!"
    visit board_path(@alice_board)
  end
end
