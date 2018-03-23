class PagesController < ApplicationController
  def home
    @games = Game.all
    @game_paginator = Game.paginate(:page => params[:page], :per_page => 30).order("created_at DESC")
    @game_days = @game_paginator.group_by { |g| g.created_at.strftime("%B, %d") }
  end
  
  
  def show
    render template: "pages/#{params[:page]}"
  end
  
end