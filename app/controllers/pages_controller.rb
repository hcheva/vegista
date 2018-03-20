class PagesController < ApplicationController
  def home
    @games = Game.all.order("created_at DESC")
  end
  
  def show
    render template: "pages/#{params[:page]}"
  end
  
end