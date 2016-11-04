class PrototypesController < ApplicationController

  before_action :find_params, only: [:show, :edit, :destroy]

  def index
  end

  def show
    @like = current_user.likes(prototype_id: params[:prototype_id]) if user_signed_in?
    @comment = Comment.new
    @comments = @prototype.comments.eager_load(:user)
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
  end

  def update
    if current_user.prototypes.find(params[:id]).update(prototype_params)
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

  private
  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, images_attributes: [:image, :prototype_id, :status]).merge(tag_list: params[:prototype][:tag])
  end

  def find_params
    @prototype = Prototype.find(params[:id])
  end

end

