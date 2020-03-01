class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#   get '/recipes/new' do 
#     # @recipes = Recipe.create(params)
#     # @recipes.save
#     erb :new
#   end

#   # code actions here!
#   get '/recipes' do 
#     @recipes = Recipe.all
#     erb :index
#   end

#   get '/recipes/:id' do 
#     @recipes = Recipe.find_by_id(params[:id])
#     erb :show
#   end

#   get '/recipes/:id/edit' do 
#     @recipes = Recipe.find_by_id(params[:id])
#     erb :edit
#   end

   
# patch '/recipes/:id' do #edit action
#   @recipes = Recipe.find_by_id(params[:id])
#   @recipes.name = params[:name]
#   @recipes.ingredients = params[:ingredients]
#   @recipes.cook_time = params[:cook_time]
#   @recipes.save
#   redirect to "/recipes/#{@recipes.id}"
# end

# post '/recipes' do 
#   @recipes = Recipe.create(params)
#   redirect to "/recipes/#{@recipes.id}"
# end

# delete '/recipes/:id' do #delete action
#   @recipes = Recipe.find_by_id(params[:id])
#   @recipes.delete
#   redirect to '/recipes'
# end

# end
get '/recipes/new' do #loads new form
  erb :new
end

get '/recipes' do #loads index page
  @recipes = Recipe.all
  erb :index
end

get '/recipes/:id' do  #loads show page
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
end

get '/recipes/:id/edit' do #loads edit form
  @recipe = Recipe.find_by_id(params[:id])
  erb :edit
end

patch '/recipes/:id' do  #updates a recipe
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.id}"
end

post '/recipes' do  #creates a recipe
  @recipe = Recipe.create(params)
  redirect to "/recipes/#{@recipe.id}"
end

delete '/recipes/:id' do #destroy action
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes'
end

end
