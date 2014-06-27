require "test_helper"

feature "Can Create Board" do
  include Warden::Test::Helpers
  background do
    @user = create(:user)
    login_as @user, :scope => :user
    visit root_path
    @board_title = 'board_num#' + rand(10000).to_s
    click_link 'openNewBoardPopup'
    fill_in 'board_title', with: @board_title
    click_button 'board-submit'

  end
  scenario "There should be three list assinged to the board" do
    page.must_have_content "title: #{@board_title}"
    page.must_have_content 'Todo'
  end

  scenario "Board should be assinged to the current user" do
    board = Board.find_by(title: @board_title)
    board.user.must_equal @user
  end
end
