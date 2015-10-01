require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path#, count: 1
    assert_select "a[href=?]", pages_help_path
  end
end
