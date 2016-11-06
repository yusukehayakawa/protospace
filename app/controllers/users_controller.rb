class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:tags).page(params[:page]).per(8)
  end
end
