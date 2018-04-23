require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/transaction.rb")
require_relative("./models/tag.rb")
require_relative("./models/merchant.rb")

# the index
get "/transactions" do
  @budget_limit = 1400
  @total_transactions = Transaction.find_total[0]
  @transactions = Transaction.all()
  @monthly_totals = Transaction.calc_monthly_total()
  erb(:"transactions/index")
end

get "/tags" do
  @budget_limit = 1400
  @total_transactions = Transaction.find_total[0]
  @transactions = Transaction.tag_transactions()
  @tag_totals = Transaction.calc_tag_transactions()
  erb(:"tags/index")
end

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

# get "/tags" do
#   @tags = Tag.all()
#   erb(:"tags/index")
# end

# new
get "/transactions/new" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

get "/tags/new" do
  erb(:"tags/new")
end

get "/merchants/new" do
  erb(:"merchants/new")
end

#
# # show - i.e. an individual transaction
get "/transactions/:id" do
  @budget_limit = 1400
  @total_transactions = Transaction.find_total[0]
  @transaction = Transaction.find(params[:id] )
  erb(:"transactions/show")
end

get "/tags/:id" do
  @budget_limit = 1400
  @total_transactions = Transaction.find_total[0]
  @total_by_tag = Tag.find_tag_total(params[:id])[0]
  @transactions = Tag.find_tags(params[:id] )
  erb(:"tags/show")
end

# get "/tags/:id" do
#    @transaction = Tag.find_tag_total(params[:id] )
#   erb(:"tags/tagtotal")
# end

# create
post "/transactions" do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to "/transactions"
end

post "/tags" do
  tag = Tag.new(params)
  tag.save()
  redirect to "/tags"
end

post "/merchants" do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to "/merchants"
end

# # edit
# get "/students/:id/edit" do
#   @houses = House.all()
#   @student = Student.find(params[:id])
#   erb(:edit)
# end
#
# # update
# post "/students/:id/edit" do
#   updated_student= Student.new(params)
#   updated_student.update
#   redirect to "students/#{updated_student.id}"
# end

# destroy
post "/transactions/:id/delete" do
  transaction = Transaction.find(params[:id] )
  transaction.delete()
  redirect to "/transactions"
end
