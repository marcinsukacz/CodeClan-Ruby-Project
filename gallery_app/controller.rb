require('sinatra')
require('sinatra/contrib/all')
require_relative('models/exibition')
require_relative('models/artist')
also_reload('./models/*')

get '/visitors' do
  @exibitions = Exibition.all
  erb(:visitor_view)
end

get '/management/exibitions' do
  @exibitions = Exibition.all
  erb(:manager_view)
end

get '/management/artists' do
  @artists = Artist.all
  erb(:artists)
end

get '/management/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:show_artist)
end

get '/management/exibitions/:id' do
  @exibition = Exibition.find(params['id'])
  erb(:show_exibition)
end

get '/exibitions/:id/edit' do
  @artists = Artist.all
  @exibition = Exibition.find(params['id'])
  erb(:edit_exibition)
end

get '/artists/:id/edit' do
  @exibitions = Exibition.all
  @artist = Artist.find(params['id'])
  erb(:edit_artist)
end
