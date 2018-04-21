require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/transaction.rb")
require_relative("./models/tag.rb")
require_relative("./models/merchant.rb")

# the index
get "/transactions" do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get "/tags" do
  @tags = Tag.all()
  erb(:"tags/index")
end

# new
get "/transactions/new" do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end
#
# # show - i.e. an individual transaction
get "/transactions/:id" do
  @transaction = Transaction.find(params[:id] )
  erb(:"transactions/show")
end



get "/tags/:id" do
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
