require "test_helper"

class GrandmaIdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grandma_id = grandma_ids(:one)
  end

  test "should get index" do
    get grandma_ids_url
    assert_response :success
  end

  test "should get new" do
    get new_grandma_id_url
    assert_response :success
  end

  test "should create grandma_id" do
    assert_difference("GrandmaId.count") do
      post grandma_ids_url, params: { grandma_id: { address: @grandma_id.address, name: @grandma_id.name } }
    end

    assert_redirected_to grandma_id_url(GrandmaId.last)
  end

  test "should show grandma_id" do
    get grandma_id_url(@grandma_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_grandma_id_url(@grandma_id)
    assert_response :success
  end

  test "should update grandma_id" do
    patch grandma_id_url(@grandma_id), params: { grandma_id: { address: @grandma_id.address, name: @grandma_id.name } }
    assert_redirected_to grandma_id_url(@grandma_id)
  end

  test "should destroy grandma_id" do
    assert_difference("GrandmaId.count", -1) do
      delete grandma_id_url(@grandma_id)
    end

    assert_redirected_to grandma_ids_url
  end
end
