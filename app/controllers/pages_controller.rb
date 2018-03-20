class PagesController < ApplicationController
  def home
    @games = Game.all.order("created_at DESC")
  end
end