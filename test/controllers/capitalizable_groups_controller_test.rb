require 'test_helper'

class CapitalizableGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capitalizable_group = capitalizable_groups(:one)
  end

  test "should get index" do
    get capitalizable_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_capitalizable_group_url
    assert_response :success
  end

  test "should create capitalizable_group" do
    assert_difference('CapitalizableGroup.count') do
      post capitalizable_groups_url, params: { capitalizable_group: { capitalizable_rate: @capitalizable_group.capitalizable_rate, description: @capitalizable_group.description } }
    end

    assert_redirected_to capitalizable_group_url(CapitalizableGroup.last)
  end

  test "should show capitalizable_group" do
    get capitalizable_group_url(@capitalizable_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_capitalizable_group_url(@capitalizable_group)
    assert_response :success
  end

  test "should update capitalizable_group" do
    patch capitalizable_group_url(@capitalizable_group), params: { capitalizable_group: { capitalizable_rate: @capitalizable_group.capitalizable_rate, description: @capitalizable_group.description } }
    assert_redirected_to capitalizable_group_url(@capitalizable_group)
  end

  test "should destroy capitalizable_group" do
    assert_difference('CapitalizableGroup.count', -1) do
      delete capitalizable_group_url(@capitalizable_group)
    end

    assert_redirected_to capitalizable_groups_url
  end
end
