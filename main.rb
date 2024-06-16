require "minitest/autorun"
require 'date'
require "xirr"


class Test < Minitest::Test
  def test_bug
    cf = Xirr::Cashflow.new

    cf << Xirr::Transaction.new(-400,date:Date.strptime("10/09/2019","%d/%m/%Y"))
    cf << Xirr::Transaction.new(-400,date:Date.strptime("21/01/2020","%d/%m/%Y"))
    cf << Xirr::Transaction.new(-400,date:Date.strptime("24/02/2020","%d/%m/%Y"))
    cf << Xirr::Transaction.new(895.24,date:Date.strptime("16/03/2020","%d/%m/%Y"))

    assert_equal( -74.20, (cf.xirr * 100).round(2))
  end
end
