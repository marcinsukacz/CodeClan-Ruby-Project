require_relative('../db/sql_runner')
require_relative('./artist')

class Exibition

  attr_reader :id, :title, :category, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @category = options['category']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO exibitions (title, category, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @category, @artist_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE exibitions SET (title, category, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @category, @artist_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM exibitions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM exibitions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    exibition = Exibition.new(result)
    return exibition
  end

  def self.all()
    sql = "SELECT * FROM exibitions"
    exibition_data = SqlRunner.run(sql)
    exibitions = exibition_data.map { |exibition| Exibition.new(exibition) }
    return exibitions
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run( sql,values )
    result = Artist.new( artist.first )
    return result
  end

end
