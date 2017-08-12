require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  test "should get index" do
    get accounts_index_url
=======
  test "should get show" do
    get accounts_show_url
>>>>>>> 2080fad9897482a233ab8b0908838daee859f24e
    assert_response :success
  end

end
