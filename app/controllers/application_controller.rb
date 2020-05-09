class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe1 = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe1 = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe1 = Recipe.find(params[:id])
    @recipe1.update(params)
    redirect to "/recipes/#{@recipe1.id}"
  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect to '/recipes'
  end

end
