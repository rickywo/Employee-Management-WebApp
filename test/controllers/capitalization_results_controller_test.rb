require 'test_helper'

class CapitalizationResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capitalization_result = capitalization_results(:one)
  end

  test "should get index" do
    get capitalization_results_url
    assert_response :success
  end

  test "should get new" do
    get new_capitalization_result_url
    assert_response :success
  end

  test "should create capitalization_result" do
    assert_difference('CapitalizationResult.count') do
      post capitalization_results_url, params: { capitalization_result: { date: @capitalization_result.date, employee_name: @capitalization_result.employee_name, full_project_name: @capitalization_result.full_project_name, hourly_rate: @capitalization_result.hourly_rate, hours: @capitalization_result.hours, project_name: @capitalization_result.project_name } }
    end

    assert_redirected_to capitalization_result_url(CapitalizationResult.last)
  end

  test "should show capitalization_result" do
    get capitalization_result_url(@capitalization_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_capitalization_result_url(@capitalization_result)
    assert_response :success
  end

  test "should update capitalization_result" do
    patch capitalization_result_url(@capitalization_result), params: { capitalization_result: { date: @capitalization_result.date, employee_name: @capitalization_result.employee_name, full_project_name: @capitalization_result.full_project_name, hourly_rate: @capitalization_result.hourly_rate, hours: @capitalization_result.hours, project_name: @capitalization_result.project_name } }
    assert_redirected_to capitalization_result_url(@capitalization_result)
  end

  test "should destroy capitalization_result" do
    assert_difference('CapitalizationResult.count', -1) do
      delete capitalization_result_url(@capitalization_result)
    end

    assert_redirected_to capitalization_results_url
  end
end
