class PagesController < ApplicationController
  def home
    @games = Game.all
    @game_days = Game.all.group_by { |g| g.created_at.strftime("%B, %d") }
  end
  
  
  def show
    render template: "pages/#{params[:page]}"
  end
  
end