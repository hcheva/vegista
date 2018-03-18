class GamesController < ApplicationController
  
before_action :set_game, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
  
  
  
  def index
    @game = current_user.games
  end
  
  def new
    @game = current_user.games.build
  end
  
  def create
    @game = current_user.games.build(game_params)
    if @game.save
      redirect_to @game, notice:"Game posted!"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @game.update(game_params)
      redirect_to @game, notice:"Game updated!"
    else
      render :edit
    end
  end
  
private
  def set_game
    @games = Game.find(params[:id])
  end
  
  def game_params
    params.require(:game).permit(:game_name, :game_description, :game_external_link, :game_genre, :game_platform)
  end
  
  
  
end