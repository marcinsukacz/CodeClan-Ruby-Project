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
    sql = "INSERT INTO exibitions (title, category) VALUES ($1, $2) RETURNING id"
    values = [@title, @category]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
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
    artist = Artist.find(@artist_id)
    return artist
  end

end
