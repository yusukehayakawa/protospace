class PrototypesController < ApplicationController

  def index
    
  end
  def new
    @prototype = Prototype.new
    3.times {@prototype.images.build}
  end

  def create
    Prototype.create(prototype_params)
    redirect_to controller: :prototypes, action: :index
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, images_attributes: [:image, :product_id, :status])
   end
end
