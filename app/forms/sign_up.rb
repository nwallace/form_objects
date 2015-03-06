class SignUp
  include ActiveModel::Model

  attr_accessor :username, :password, :password_confirmation, :terms_of_use,
                :user

  validates :username, presence: true,
                       length: { minimum: 3, maximum: 20 },
                       format: { with: /\A\w*\Z/ }
  validates :password, presence: true,
                       length: { minimum: 6 }
  validates :terms_of_use, acceptance: true, allow_nil: false

  def save
    @user = User.new(user_attrs)
    if valid? && @user.valid?
      @user.save!
      true
    else
      @user.errors.each do |field, error|
        errors.add(field, error)
      end
      false
    end
  end

  private

  def user_attrs
    {
      username: username,
      password: password,
    }
  end
end
