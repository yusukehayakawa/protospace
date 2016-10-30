class Prototypes::NewestsController < ApplicationController

  def index
     @prototypes = Prototype.includes(:user).order('id DESC')
     render template: "prototypes/index"
  end
end
