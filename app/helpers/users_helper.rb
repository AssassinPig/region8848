module UsersHelper
  def get_user_by_name(name)
    user = User.find_by_name(name)
    user.email
  end
end
