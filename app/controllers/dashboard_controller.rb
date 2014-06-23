class DashboardController < ApplicationController
  def index
    @board = Board.new
    @boards = Board.all
  end
end
