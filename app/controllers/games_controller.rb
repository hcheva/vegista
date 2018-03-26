class GamesController < ApplicationController
  
before_action :set_game, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show, :feed]
before_action :require_same_user, only: [:edit, :update]

  
  
def index
  @games = current_user.games
end
  
def feed
  # the news items
  @games = Game.order("updated_at desc")
end


  
def new
  @game = current_user.games.build
end
  
def create
  @game = current_user.games.build(game_params)
  if @game.save
    if params[:images]
      params[:images].each do |i|
        @game.photos.create(image: i)
      end
    end
    @photos = @game.photos
  redirect_to edit_game_path(@game), notice:"Game published"
  else
    render :new
  end 
end

  
def show
  @photos = @game.photos
end

  
def edit
  @photos = @game.photos
end

def update
  if @game.update(game_params)
    if params[:images]
      params[:images].each do |i|
        @game.photos.create(image: i)
      end
    end
    @photos = @game.photos
    
    redirect_to edit_game_path(@game), notice: "Game updated"
  else
    render :edit
  end
end
  
  
private
  
def set_game
  @game = Game.find(params[:id])
end
  
def game_params
  params.require(:game).permit(:game_name, :game_external_link, :game_genre, :game_platform, :game_description)
end
  
def require_same_user
  if current_user.id != @game.user_id
    flash[:danger] = "You can't edit this game"
    redirect_to root_path
  end
end

  

end