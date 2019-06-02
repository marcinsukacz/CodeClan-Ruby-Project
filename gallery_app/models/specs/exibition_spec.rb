require('minitest/autorun')
require('minitest/rg')
require_relative('../exibition')

class TestExibition < MiniTest::Test

def setup
  @exibition1 = Exibition.new({'title' => 'Walls of London', 'category' => 'streetart'})
end

def test_title()
  result = @exibition1.title
  assert_equal('Walls of London', result)
end

end
