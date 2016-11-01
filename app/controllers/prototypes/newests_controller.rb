class Prototypes::NewestsController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user).order('id DESC')
  end
end
