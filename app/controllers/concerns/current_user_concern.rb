module CurrentUserConcern
  extend ActiveSupport::Concern

  # we want current user not only for devise, but for everyone
  def current_user
    super || guest_user
  end

  def guest_user
    # Commented because this will be refactored
    # OpenStruct.new(name: "Guest User",
    #                first_name: "Guest",
    #                last_name: "User",
    #                email: "guest@nowhere.com")

    guest = GuestUser.new

    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@nowhere.com"
    guest
  end
end