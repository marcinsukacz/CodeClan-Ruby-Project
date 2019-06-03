require_relative('../models/artist')
require_relative('../models/exibition')

artist1 = Artist.new({'alias' => 'Banksy'})
artist2 = Artist.new({'alias' => 'Andy Warhol'})

artist1.save
artist2.save

exibition1 = Exibition.new({
  'title' => 'Walls of London',
  'category' => 'street-art',
  'artist_id' => artist1.id
  })
exibition2 = Exibition.new({
  'title' => "Andy's 60s",
  'category' => 'pop-art',
  'artist_id' => artist2.id

  })

exibition1.save
exibition2.save
