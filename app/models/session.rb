class Session
  include ActiveModel::Model

  attr_accessor :username, :password

  validates :username, presence: true
  validates :password, presence: true
  validate :correct_authentication

  def initialize(session, attributes={})
    self.session = session
    super(attributes)
  end

  def authenticate!
    raise "Cannot authenticate User #{user}" unless user

    session[:user_id] = user.id
  end

  private

  attr_accessor :session

  def correct_authentication
    unless user && user.authenticate(password)
      errors.add(:base, "Invalid username or password")
    end
  end

  def user
    @user ||= User.find_by(username: username) if username
  end
end
