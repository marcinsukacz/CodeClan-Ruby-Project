require('sinatra')
require('sinatra/contrib/all')
require_relative('models/exibition')
require_relative('models/artist')
also_reload('./models/*')

get '/visitors' do
  @exibitions = Exibition.all
  erb(:visitor_view)
end
