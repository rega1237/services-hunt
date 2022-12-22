class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @services = Service.where(user: @user)
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end