require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get root" do
    assert_routing '/', controller: 'pages', action: 'home'
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
#    assert_select "title", "Help | Ruby on Rails Tutorial Sample App" # See M.Hartl^ ch.3
#    assert_select "title", {count: 1}
  end
end
