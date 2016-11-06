class Prototypes::NewestsController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user, :tags).order('id DESC').page(params[:page]).per(8)
  end
end
