require "test_helper"

feature "CanAddCardToList" do
  self.use_transactional_fixtures = false
  background do
    @board_title = 'board_num#' + rand(10000).to_s
    @board = Board.create(title: @board_title)
  end

  scenario "Add new card to lists", js: true do
    Capybara.default_selector = :css
    @board_title = "board_num#{rand(10000).to_s}"
    @board = Board.create!(title: @board_title)
    @lists = @board.lists

    visit board_path @board
    click_link "newCardOpenner#{@lists.first.id.to_s}"
    within "#addCardPopup#{@lists.first.id.to_s}" do
      fill_in 'card_title', with: 'Really Long Text…'
      click_button 'Create Card'
    end
  end
end
