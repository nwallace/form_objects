module SessionSpecHeleprs

  def log_in(user=nil)
    user ||= User.create!(username: "hal", password: "kubrick")
    controller.session[:user_id] = user.id
  end
end
