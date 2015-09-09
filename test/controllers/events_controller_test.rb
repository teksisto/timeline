# coding: utf-8
require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:first_packets)
  end

  # TODO
  #
  # Следующие два теста не проходят и выдают ошибку. Я подозреваю, что
  # это из-за того, что fixtures как-то по своему инициализируются. С
  # другой стороны, добавление Rails.application.load_seed в
  # test_helper не помогает. Возможно это какой-то мой затуп, потому
  # что смотрю я на это уже довольно долго. Текст ошибки:
  #
  # event.rb:70: undefined method `year' for nil:NilClass
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get index with vis" do
    get :index, parameters: {render_method: ['vis']}
    assert_response :success
    assert_not_nil assigns(:events)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: {description: @event.description, start_date: @event.start_date, label: @event.label}
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { description: @event.description, label: @event.label, start_date: @event.start_date }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
