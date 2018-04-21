require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/transaction.rb")

# the index
get "/transactions" do
  @transactions = Transaction.all()
  erb(:index)
end

get "/merchants" do
  @merchants = Merchant.all()
  erb(:index)
end

get "/tags" do
  @tags = Tag.all()
  erb(:index)
end

# testing

get "/transactions" do
  @transactions = Transaction.find_by_tag()
  erb(:indexbytag)
end

get "/merchants" do
  @merchants = Merchant.all()
  erb(:indexbytag)
end

get "/tags" do
  @tags = Tag.all()
  erb(:indexbytag)
end

# end testing


# new
get "/transactions/new" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:new)
end
#
# # show - i.e. an individual order
get "/transactions/:id" do
  @transaction = Transaction.find(params[:id] )
  erb(:show)
end

# create
post "/transactions" do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to "/transactions"
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