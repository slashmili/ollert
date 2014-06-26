require "test_helper"

feature "Can Create Board" do
  before(:all) do
    #TODO: How can I apply it for all?
    #Capybara.current_driver = :webkit
  end
  scenario "Create new board and make sure there are three list assinged to it", js: true do
    skip
    visit root_path
    board_title = 'board_num#' + rand(10000).to_s
    click_link 'openNewBoardPopup'
    fill_in 'board_title', with: board_title
    click_button 'board-submit'
    page.must_have_content 'title: ' + board_title
    page.must_have_content 'Todo'
  end
end
