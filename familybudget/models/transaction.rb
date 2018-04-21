require_relative('../db/sql_runner')
require_relative('./tag.rb')
require_relative('./merchant.rb')

class Transaction

  attr_reader :transaction_date, :amount, :debit, :merchant_id, :tag_id, :id

  def initialize( options )
    @id = options['id'].to_i
    @transaction_date = options['transaction_date']
    @amount = options['amount']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      transaction_date,
      amount,
      merchant_id,
      tag_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING *;"
    values = [@transaction_date, @amount, @merchant_id, @tag_id]
    transaction_data = SqlRunner.run(sql, values)
    @id = transaction_data.first()['id'].to_i
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run( sql, values )
    result = Transaction.new( transaction.first )
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run( sql )
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def find_by_tag
    sql = "SELECT * FROM transactions WHERE tag_id = $1;"
    values = [@tag_id]
    tagtransactions = SqlRunner.run( sql )
    result = tagtransactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def find_merchant( )
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    merchant = SqlRunner.run( sql, values )
    result = Merchant.new( merchant.first )
    return result
  end

  def find_tag( )
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    tag = SqlRunner.run( sql, values )
    result = Tag.new( tag.first )
    return result
  end

end
