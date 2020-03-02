class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end
  get '/recipes' do #read
    @recipes = Recipe.all 
    erb :index
  end
  get '/recipes/new' do #new
    @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :new
  end
  post '/recipes' do #create
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  patch '/recipes/:id' do #update
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params["ingredients"]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end
  delete '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end
end
