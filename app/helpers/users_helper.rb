module UsersHelper
  def admin?
    if current_user.role =="admin"
      true
    end
  end
  def user_manager?
    if current_user.role == "user_manager"
      true
    end
  end
end
