class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @board = Board.new
    @boards = current_user.boards.all
  end
end
