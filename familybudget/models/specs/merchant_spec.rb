require("minitest/autorun")
require_relative("../merchant.rb")

class MerchantTest < MiniTest::Test

  def setup
    @merchant = Merchant.new("British Rail")
  end

  def test_merchant_has_name
    assert_equal("British Rail", @merchant.merchant_name())
  end

end
