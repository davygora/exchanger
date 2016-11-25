require 'minitest/autorun'
require_relative 'app'
require_relative 'main_data'

class TestExchanger < Minitest::Test

  def setup
    Exchanger.new
  end

  def test_exchange_count_on_date
    assert_equal 110.62, Exchanger.exchange(100, '2016-11-07')
  end

  def test_exchange_count_on_dates
    assert_equal [105.47999999999999, 109.25, 107.65],
    Exchanger.exchange(100, [Date.yesterday, '2016-10-26', Date.today - 10.day])
  end

  def test_exchange_when_date_is_empty
    assert_raises ArgumentError do
      Exchanger.exchange(100, '')
    end
  end

  def test_exchange_when_count_is_empty
    assert_raises ArgumentError do
      Exchanger.exchange('2016-10-26')
    end
  end
end

class TestMainData < Minitest::Test

  def setup
    MainData.new
  end

  def test_select_rate
    rate = MainData.where("date = ?", '2016-10-17').first
    rate.course
    assert_equal 1.0994, rate.course
  end
end

