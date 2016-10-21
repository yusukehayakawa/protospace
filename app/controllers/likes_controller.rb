class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
  end
  def destroy
    like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    like.destroy
    @prototype = Prototype.find(params[:prototype_id])
  end
end
