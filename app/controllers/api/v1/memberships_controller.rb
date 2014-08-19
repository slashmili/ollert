class Api::V1::MembershipsController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!, only: [:index]

  def index
    @memberships = Membership.where(id: params[:ids])
    respond_with @memberships
    @memberships.each do |mem|
      authorize! :read, mem
    end
  end
end
