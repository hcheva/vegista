class PagesController < ApplicationController
  def home
    @games = Game.all
    @game_days = Game.order("created_at DESC").group_by { |g| g.created_at.strftime("%B, %d") }
    
  end
  
  
  def show
    render template: "pages/#{params[:page]}"
  end
  
end