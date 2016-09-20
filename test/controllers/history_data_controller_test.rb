require 'test_helper'
include HistoryDataHelper

class HistoryDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history_datum = history_data(:one)
  end

  test "should get index" do
    get history_data_url
    assert_response :success
  end

  test "should get new" do
    get new_history_datum_url
    assert_response :success
  end

  test "should create history_datum" do
    assert_difference('HistoryDatum.count') do
      post history_data_url, params: { history_datum: { iteration_data: @history_datum.iteration_data, result_data: @history_datum.result_data } }
    end

    assert_redirected_to history_datum_url(HistoryDatum.last)
  end

  test "should show history_datum" do
    get history_datum_url(@history_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_datum_url(@history_datum)
    assert_response :success
  end

  test "should update history_datum" do
    patch history_datum_url(@history_datum), params: { history_datum: { iteration_data: @history_datum.iteration_data, result_data: @history_datum.result_data } }
    assert_redirected_to history_datum_url(@history_datum)
  end

  test "should destroy history_datum" do
    assert_difference('HistoryDatum.count', -1) do
      delete history_datum_url(@history_datum)
    end

    assert_redirected_to history_data_url
  end

  test "should get history_data" do
    restore_iteration_data(38)
  end
end
