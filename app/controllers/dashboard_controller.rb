class DashboardController < ApplicationController
  def index
    @board = Board.new
    @boards = current_user.boards.all
  end
end
