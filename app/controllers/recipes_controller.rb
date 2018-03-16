class RecipesController < ApplicationController
  
before_action :set_recipe, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]

def index
    @recipes = current_user.recipes
end
  
def new
  @recipe = current_user.recipes.build
end
  
def create
  @recipe = current_user.recipes.build(recipe_params)
  if @recipe.save
    if params[:images]
      params[:images].each do |i|
        @recipe.pictures.create(image: i)
      end
    end
    
    @pictures = @recipe.pictures
        
    redirect_to edit_recipe_path(@recipe), notice:"Recipe published"
  else
    render :new
  end
    
end

  
def show
  @pictures = @recipe.pictures
end
  
def edit
  @pictures = @recipe.pictures
end

def update
  if @recipe.update(recipe_params)
    if @recipe.save
    if params[:images]
      params[:images].each do |i|
        @recipe.pictures.create(image: i)
      end
    end
    
    @pictures = @recipe.pictures
    redirect_to edit_recipe_path(@recipe), notice:"Recipe updated"
  else
    render :edit
  end
    
end
  
  
private
def set_recipe
  @recipe = Recipe.find(params[:id])
end
  
def recipe_params
  params.require(:recipe).permit(:recipe_name, :recipe_external_link, :recipe_category, :recipe_description)
end

def require_same_user
  if current_user.id != @recipe.user_id
    flash[:danger] = "You can't edit this recipe"
    redirect_to root_path
  end
end
  
  
end