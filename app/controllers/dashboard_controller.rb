class DashboardController < ApplicationController
  def index
    @board = Board.new
  end
end
