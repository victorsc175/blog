# ApplicationHelper
module ApplicationHelper
  def can_create_post?
    current_user && current_user.creator?
  end

  def can_edit_post?
    current_user && current_user.moderator?
  end

  def can_delete_post?
    current_user && current_user.moderator?
  end

  def can_manage_users?
    current_user && current_user.moderator?
  end
end
