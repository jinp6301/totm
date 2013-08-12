class RecipesController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.reverse
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to recipes_url
    else
      redirect_to new_recipe_url
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to root_url
    else
      render :edit
    end
  end


end
