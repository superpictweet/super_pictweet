module UsersHelper
  def not_me?(user)
    current_user != user
  end
end
