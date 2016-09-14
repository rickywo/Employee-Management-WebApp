require 'test_helper'

class AttendanceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance_type = attendance_types(:one)
  end

  test "should get index" do
    get attendance_types_url
    assert_response :success
  end

  test "should get new" do
    get new_attendance_type_url
    assert_response :success
  end

  test "should create attendance_type" do
    assert_difference('AttendanceType.count') do
      post attendance_types_url, params: { attendance_type: { attendance_rate: @attendance_type.attendance_rate, description: @attendance_type.description, name: @attendance_type.name } }
    end

    assert_redirected_to attendance_type_url(AttendanceType.last)
  end

  test "should show attendance_type" do
    get attendance_type_url(@attendance_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_attendance_type_url(@attendance_type)
    assert_response :success
  end

  test "should update attendance_type" do
    patch attendance_type_url(@attendance_type), params: { attendance_type: { attendance_rate: @attendance_type.attendance_rate, description: @attendance_type.description, name: @attendance_type.name } }
    assert_redirected_to attendance_type_url(@attendance_type)
  end

  test "should destroy attendance_type" do
    assert_difference('AttendanceType.count', -1) do
      delete attendance_type_url(@attendance_type)
    end

    assert_redirected_to attendance_types_url
  end
end
