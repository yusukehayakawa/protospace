class PrototypesController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user)
  end

  def show
    find_params
    @like = current_user.likes(prototype_id: params[:prototype_id]) if user_signed_in?
    @comments = Comments.find(params[:id]) unless @comments.blank?
    @comment = Comment.new
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
    find_params
  end

  def update
    if current_user.find_params.update(prototype_params)
       redirect_to :root, success: "Prototype was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if find_params.destroy
      redirect_to :root, success: "Prototype was successfully deleted."
    end
  end

  def find_params
    @prototype = Prototype.find(params[:id])
  end

  private
  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, images_attributes: [:image, :prototype_id, :status])
  end

end

