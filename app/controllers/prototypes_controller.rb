class PrototypesController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    Prototype.create(prototype_params)
    redirect_to :root and return
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, images_attributes: [:id, :image, :prototype_id, :status]).merge(user_id: current_user.id)
  end

end

