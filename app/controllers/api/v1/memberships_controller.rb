class Api::V1::MembershipsController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!, only: [:index, :update, :destroy]

  def index
    @memberships = Membership.where(id: params[:ids])
    respond_with @memberships
    @memberships.each do |mem|
      authorize! :read, mem
    end
  end

  def update
    @membership = Membership.find(params[:id])
    authorize! :edit, @membership
    @membership.roles = params[:membership][:roles]
    @membership.save
    render json: @membership, status: :ok
  end

  def destroy
    @membership = Membership.find(params[:id])
    authorize! :destroy, @membership
    @membership.destroy
    respond_with {}
  end

  private

  def membership_params
    params.require(:membership).permit(:id, :roles, :board_id, :user_id)
  end

end
