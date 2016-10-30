class Prototypes::PopularsController < ApplicationController
  def index
     @prototypes = Prototype.includes(:user).order('likes_count DESC')
     render template: "prototypes/index"
  end
end
