module UsersHelper

  def inviter(user)
    if user.invited_by_type == "Organization"
      inviter = Organization.find_by_id(user.invited_by_id)
      link_to inviter.name, organization_path(user.invited_by_id)
    elsif user.invited_by_type == "User"
      inviter = User.find_by_id(user.invited_by_id)
      if inviter.name.blank?
        link_to inviter.email, user_path(user.invited_by_id)
      else
        link_to inviter.name, user_path(user.invited_by_id)
      end
    end
  end

end
