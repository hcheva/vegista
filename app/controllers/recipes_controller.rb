class RecipeController < ApplicationController
  
before_action :set_recipe, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

def index
    @recipes = current_user.recipes
end
  
def new
  @recipe = current_user.recipes.build
end
  
def create
  @recipe = current_user.recipes.build(recipe_params)
  if @recipe.save
    redirect_to @recipe, notice:"Recipe published"
  else
    render :new
  end
    
end

  
def show
end
  
def edit
end

def update
  if @recipe.update(recipe_params)
    redirect_to @recipe, notice:"Recipe updated"
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
  
  
end