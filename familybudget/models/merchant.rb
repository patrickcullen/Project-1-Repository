require_relative('../db/sql_runner')

class Merchant

  attr_reader :merchant_name, :id

  def initialize( options )
    @id = options['id'].to_i
    @merchant_name = options['merchant_name']
  end

  def save()
    sql = "INSERT INTO merchants (merchant_name)
    VALUES ($1)
    RETURNING *"
    values = [@merchant_name]
    merchant_data = SqlRunner.run(sql, values)
    @id = merchant_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run( sql )
    result = merchants.map { |merchant| Merchant.new(merchant) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def self.find( id )
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run( sql, values )
    result = Merchant.new( merchant.first )
    return result
  end

end
