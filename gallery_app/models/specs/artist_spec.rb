require('minitest/autorun')
require('minitest/rg')
require_relative('../artist')

class TestArtist < MiniTest::Test

def setup
  @artist1 = Artist.new({'alias' => 'Banksy'})
end

def test_alias()
  result = @artist1.alias
  assert_equal('Banksy', result)
end

end
