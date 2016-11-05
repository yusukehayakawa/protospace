class Prototypes::NewestsController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user, :tags).order('id DESC')
  end
end
