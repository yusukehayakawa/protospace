class PrototypesController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @like = current_user.likes(prototype_id: params[:prototype_id])
  end

  def new
    @prototype = Prototype.new
    @prototype.images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)

    @prototype.images.build if @prototype.images.blank?

    if @prototype.save
      redirect_to :root, success: "Successfully created your prototype."
    else
      render :new and return
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if current_user.prototypes.find(params[:id]).update(prototype_params)
       redirect_to :root, success: "Prototype was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if Prototype.find(params[:id]).destroy
      redirect_to :root, success: "Prototype was successfully deleted."
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, images_attributes: [:image, :prototype_id, :status])
  end

end

