require 'test_helper'

class Date
  def inspect
    self.strftime('%Y-%m-%d')
  end
end

class EventTest < ActiveSupport::TestCase

  def setup
    @event = Event.new
    @event.label = 'test'
  end
  
  test "event 1969" do
    @event.start_date = '1969'
    @event.save
    assert_equal Date.parse('1969-06-15'), @event.start_date, 'start_date'
    assert_not @event.end_date 
  end

  test "event 1969-02" do
    @event.start_date = '1969-02'
    @event.save
    assert_equal Date.parse('1969-02-15'), @event.start_date, 'start_date'
    assert_not @event.end_date 
  end

  test "event 1969-03-01" do
    @event.start_date = '1969-03-01'
    @event.save
    assert_equal Date.parse('1969-03-01'), @event.start_date, 'start_date'
    assert_not @event.end_date 
  end
  
  test "event 1969 | period=true" do
    @event.start_date = '1969'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-01-01'), @event.start_date, 'start_date'
    assert_equal Date.parse('1969-12-31'), @event.end_date,   'end_date'
  end

  test "event 1969-09 (30) | period=true" do
    @event.start_date = '1969-09'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-09-01'), @event.start_date, 'start_date'
    assert_equal Date.parse('1969-09-30'), @event.end_date,   'end_date'
  end

  test "event 1969-08 (31) | period=true" do
    @event.start_date = '1969-08'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-08-01'), @event.start_date, 'start_date'
    assert_equal Date.parse('1969-08-31'), @event.end_date,   'end_date'
  end

  test "event with start year, month, day and period" do
    @event.start_date = '1969-08-13'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-08-13'), @event.start_date, 'start_date'
    assert_equal Date.parse('1969-08-13'), @event.end_date,   'end_date'
  end

  test "event 1969 | 1970 | period=true" do
    @event.start_date = '1969'
    @event.end_date = '1970'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-06-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-06-15'), @event.end_date,   'end_date'
  end

  test "event 1969-07 | 1970 | period=true" do
    @event.start_date = '1969-07'
    @event.end_date = '1970'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-12-31'), @event.end_date,   'end_date'
  end

  test "event 1969-07-04 | 1970 | period=true" do
    @event.start_date = '1969-07-04'
    @event.end_date = '1970'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-04'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-12-31'), @event.end_date,   'end_date'
  end

  test "event 1969-07-05 | 1970-02 | period=true" do
    @event.start_date = '1969-07-05'
    @event.end_date = '1970-02'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-05'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-15'), @event.end_date,   'end_date'
  end

  test "event 1969-07 | 1970-02 | period=true" do
    @event.start_date = '1969-07'
    @event.end_date = '1970-02'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-15'), @event.end_date,   'end_date'
  end

  test "event 1969-07 | 1970-02-13 | period=true" do
    @event.start_date = '1969-07'
    @event.end_date = '1970-02-13'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-13'), @event.end_date,   'end_date'
  end

  test "event 1969 | 1970-02-13 | period=true" do
    @event.start_date = '1969'
    @event.end_date = '1970-02-13'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-06-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-13'), @event.end_date,   'end_date'
  end

  test "event 1969 | 1970-02 | period=true" do
    @event.start_date = '1969'
    @event.end_date = '1970-02'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-06-15'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-15'), @event.end_date,   'end_date'
  end

  
  test "event 1969-07-05 | 1970-02-19 | period=true" do
    @event.start_date = '1969-07-05'
    @event.end_date = '1970-02-19'
    @event.period = true
    @event.save
    assert_equal Date.parse('1969-07-05'), @event.start_date, 'start_date'
    assert_equal Date.parse('1970-02-19'), @event.end_date,   'end_date'
  end
  
end
