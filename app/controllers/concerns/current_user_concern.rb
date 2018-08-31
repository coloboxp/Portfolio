module CurrentUserConcern
  extend ActiveSupport::Concern

  # we want current user not only for devise, but for everyone
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@nowhere.com")
  end
end