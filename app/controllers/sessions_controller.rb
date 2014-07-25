class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  respond_to :json
  def index
    render json: current_user || {id: -1}
  end
end
