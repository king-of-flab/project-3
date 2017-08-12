require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_index_url
  test "should get show" do
    get accounts_show_url
    assert_response :success
  end

end
