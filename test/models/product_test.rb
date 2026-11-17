require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    tshirt = products(:tshirt)
    trousers = products(:trousers)

    tshirt.update(inventory_count: 0)
    trousers.update(inventory_count: 0)

    assert_emails 2 do
      tshirt.update(inventory_count: 9)
      trousers.update(inventory_count: 3)
    end
  end
end
