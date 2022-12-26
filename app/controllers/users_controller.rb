class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    authorize! :show, @user
    @services = Service.where(user: @user)
    @categories = Category.all
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end