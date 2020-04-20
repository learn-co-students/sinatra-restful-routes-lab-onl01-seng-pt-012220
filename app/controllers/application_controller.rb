class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #6
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  #3
  get '/recipes/new' do 
    erb :new
  end

  #3
  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #4
  get '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  #5
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  #5
  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  
  #7
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end
