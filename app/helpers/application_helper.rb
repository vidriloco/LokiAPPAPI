module ApplicationHelper
  def authentication_fields_for(user)
    { user: { authToken: user.authentication_token, username: user.username, email: user.email }  }
  end
  
  def error_message_for(user)
    # TODO: Localize
    { message: "#{user.errors.messages.keys.first.to_s} #{user.errors.messages[user.errors.messages.keys.first].first}" }
  end
end
