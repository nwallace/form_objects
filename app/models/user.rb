class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true,
                       length: { minimum: 3, maximum: 20 },
                       format: { with: /\A\w*\Z/ }
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true
end
