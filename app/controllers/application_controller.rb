require_relative "../models/recipe.rb"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get 'recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:params])

    redirect to("/recipe/#{@recipe.id}")
  end

end
