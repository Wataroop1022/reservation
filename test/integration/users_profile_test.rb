require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsccessful edit" do
    get user_profile_path (@user)
    assert_template 'users/profile'
    patch user_path(@user), params: { user: { name: "",
      email: "foo@invalid",
      password:              "foo",
      password_confirmation: "bar"}}
  end
  # test "the truth" do
  #   assert true
  # end
end
