# ApplicationHelper
module ApplicationHelper
  def can_create_post?
    is_creator?
  end

  def can_edit_post?
    is_moderator?
  end

  def can_delete_post?
    is_moderator?
  end

  def can_manage_users?
    is_moderator?
  end

  def is_moderator?
    current_user && current_user.moderator?
  end

  def is_creator?
    current_user && current_user.creator?
  end
end
