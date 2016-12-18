class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes.includes(:tags).page(params[:page]).per(8)
  end

  def update
    redirect_to :root, success: "Your account has been updated successfully."
  end
end
