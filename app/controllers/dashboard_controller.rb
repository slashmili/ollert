class DashboardController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @board = Board.new
    @boards = Board.all
  end
end
