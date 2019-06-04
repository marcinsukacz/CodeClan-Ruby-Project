require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/exibition')
require_relative('models/artist')
also_reload('./models/*')

get '/visitors' do
  @exibitions = Exibition.all
  @artists = Artist.all
  erb(:visitor_view)
end

get '/exibitions/filter/category' do
  @exibitions = Exibition.filter_by_category(params['category'])
  erb(:filtered_view)
end

get '/exibitions/filter/artist' do 
  @exibitions = Exibition.filter_by_artist(params['alias'])
  erb(:filtered_view)
end

get '/management/exibitions' do
  @exibitions = Exibition.all
  erb(:manager_view)
end

get '/management/exibitions/new' do
   @artists = Artist.all
   @exibition = Exibition.new(params)

    erb(:new_exibition)
end

get '/management/artists' do
  @artists = Artist.all
  erb(:artists)
end

get '/management/artists/new' do
  erb(:new_artist)
end

get '/management/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:show_artist)
end

get '/visitors/:id' do
  @exibition = Exibition.find(params['id'])
  erb(:show_exibition_visitors)
end

get '/management/exibitions/:id' do
  @exibition = Exibition.find(params['id'])
  erb(:show_exibition_management)
end

get '/exibitions/:id/edit' do
  @artists = Artist.all
  @exibition = Exibition.find(params['id'])
  #@artists = Artist.all
  #@exibition = Exibition.new(params)
  erb(:edit_exibition)
end

get '/artists/:id/edit' do
  @exibitions = Exibition.all
  @artist = Artist.find(params['id'])
  erb(:edit_artist)
end



post '/artists/new' do
  Artist.new(params).save
  redirect to '/management/artists'
end

post '/exibitions/new' do
  Exibition.new(params).save
  redirect to '/management/exibitions'
end

post '/artists/:id' do
  Artist.new(params).update
  redirect to '/management/artists'
end

post '/exibitions/:id' do
  #binding.pry
  Exibition.new(params).update
  redirect to '/management/exibitions'
end

post '/artists/:id/delete' do
  Artist.new(params).delete
  redirect to '/management/artists'
end

post '/exibitions/:id/delete' do
  Exibition.new(params).delete
  redirect to '/management/exibitions'
end
