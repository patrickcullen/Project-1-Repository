require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require("pry")

Tag.delete_all()
Merchant.delete_all()
Transaction.delete_all()

merchant1 = Merchant.new({
  "merchant_name" => "John Lewis"
  })

merchant2 = Merchant.new({
  "merchant_name" => "Tescos"
  })

merchant3 = Merchant.new({
  "merchant_name" => "Spotify"
  })

merchant4 = Merchant.new({
  "merchant_name" => "Starbucks"
  })

merchant5 = Merchant.new({
  "merchant_name" => "British Rail"
  })

merchant6 = Merchant.new({
  "merchant_name" => "Clark's Bar"
  })

merchant7 = Merchant.new({
  "merchant_name" => "The Second Cup"
  })

merchant8 = Merchant.new({
  "merchant_name" => "Government"
  })

merchant9 = Merchant.new({
  "merchant_name" => "Parents"
  })

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()
merchant6.save()
merchant7.save()
merchant8.save()
merchant9.save()

tag1 = Tag.new({
  "tag_name" => "Music"
  })

tag2 = Tag.new({
  "tag_name" => "Coffee"
  })

tag3 = Tag.new({
  "tag_name" => "Groceries"
  })

tag4 = Tag.new({
  "tag_name" => "Entertainment"
  })

tag5 = Tag.new({
  "tag_name" => "Toiletries"
  })

tag6 = Tag.new({
  "tag_name" => "Parental Donation"
  })

tag7 = Tag.new({
  "tag_name" => "Student Loans"
  })


tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()

transaction1 = Transaction.new({
  "transaction_date" => "2018-02-21",
  "amount" => 4,
  "merchant_id" => merchant5.id,
  "tag_id" => tag2.id
  })

transaction2 = Transaction.new({
  "transaction_date" => "2018-02-24",
  "amount" => 21,
  "merchant_id" => merchant2.id,
  "tag_id" => tag5.id
  })

transaction1.save()
transaction2.save()

binding.pry
nil
