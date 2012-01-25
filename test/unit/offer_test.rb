require 'test_helper'

class OfferTest < ActiveSupport::TestCase

  test "offer buyers" do
    @offer_one = offers(:one)
    @buyers = @offer_one.buyers
    @expected = [people(:bob), people(:go)]
    assert_equal([], @expected - @buyers)
    assert_equal([], @buyers - @expected)
  end

  test "offer purchases by buyer" do
    @offer_one = offers(:one)
    @purchases = @offer_one.purchases_by_buyer(people(:bob))

    @expected = [purchases(:one), purchases(:two)]
    assert_equal([], @expected - @purchases)
    assert_equal([], @purchases - @expected)
  end

  test "offer prices" do
    @offer_one = offers(:one)
    @prices = @offer_one.prices

    assert_equal(11.2, @prices[people(:go)])
    assert_equal(22.6, @prices[people(:bob)])
  end

  test "offer purchase matrix" do
    @offer_one = offers(:one)
    @matrix = @offer_one.purchase_matrix

    assert_not_nil(@matrix[people(:bob).id])
    assert_not_nil(@matrix[people(:go).id])

    bob_purch = @matrix[people(:bob).id]
    assert_equal(5.0, bob_purch[products(:tom).id])
    assert_equal(3.0, bob_purch[products(:pep).id])
  end

end
