require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :alias

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @alias = options['alias']
  end

  def save()
    sql = "INSERT INTO artists alias VALUES $1 RETURNING id"
    values = [@alias]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

end
