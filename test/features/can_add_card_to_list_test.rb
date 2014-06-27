require "test_helper"

feature "CanAddCardToList" do
  include Warden::Test::Helpers
  background do
    @user = create(:user)
    login_as @user, :scope => :user
  end

  def rand_str
    rand(10000).to_s
  end

  scenario "Add new card to lists", js: true do
    #TODO: how can I cleanup the db so I don't need to create a unique name!
    board_title = "board_num#{rand_str}"
    board = create(:board, title: board_title)
    lists = board.lists

    visit board_path board
    click_link "newCardOpenner#{lists.first.id.to_s}"
    card_text = "Really Long Text... and some random #{rand_str}"
    within "#addCardPopup#{lists.first.id.to_s}" do
      fill_in 'card_title', with: card_text
      click_button 'Create Card'
    end
    visit board_path board
    page.must_have_content card_text
  end
end
