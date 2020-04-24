class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index should show all recipes (name) with a link to their other values.
  # EX. Mash potatoes: 2 russet potatoes, 30 minutes (Recipe ID: 1)

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipes = Recipe.find_by(params[:id])
    erb :show
  end

  post '/recipes/:id' do
    @recipes = Recipe.create(params)
    redirect to "/recipes/#{@recipes.id}"
  end

  get '/recipes/:id/edit' do
    @recipes = Recipe.find_by(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    id = params[:id]
     new_params = {}
     old = Recipe.find(id)
     new_params[:name] = params[:name]
     new_params[:ingredients] = params[:ingredients]
     new_params[:cook_time] = params[:cook_time]
     old.update(new_params)

     redirect to "/recipes/#{@recipes.id}"
  end

  get "/recipes/new" do
    erb :new
  end

  post '/recipes' do
    @recipes = Recipe.new(name: params[:name],ingredients: params[:ingredients],cook_time: params[:cook_time])
      @recipes.save
      redirect "/recipes/#{@recipes.id}"
  end

  delete '/recipes/:id' do
    Recipe[0].clear
    redirect to '/'
  end

end
