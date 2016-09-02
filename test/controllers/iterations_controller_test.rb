require 'test_helper'

class IterationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @iteration = iterations(:one)
  end

  test "should get index" do
    get iterations_url
    assert_response :success
  end

  test "should get new" do
    get new_iteration_url
    assert_response :success
  end

  test "should create iteration" do
    assert_difference('Iteration.count') do
      post iterations_url, params: { iteration: { end_date: @iteration.end_date, start_date: @iteration.start_date, work_day: @iteration.work_day } }
    end

    assert_redirected_to iteration_url(Iteration.last)
  end

  test "should show iteration" do
    get iteration_url(@iteration)
    assert_response :success
  end

  test "should get edit" do
    get edit_iteration_url(@iteration)
    assert_response :success
  end

  test "should update iteration" do
    patch iteration_url(@iteration), params: { iteration: { end_date: @iteration.end_date, start_date: @iteration.start_date, work_day: @iteration.work_day } }
    assert_redirected_to iteration_url(@iteration)
  end

  test "should destroy iteration" do
    assert_difference('Iteration.count', -1) do
      delete iteration_url(@iteration)
    end

    assert_redirected_to iterations_url
  end
end
