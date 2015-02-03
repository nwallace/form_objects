class User < ActiveRecord::Base

  has_secure_password

  attr_accessor :accepts_terms_of_use

  validates :username, presence: true,
                       length: { minimum: 3, maximum: 20 },
                       format: { with: /\A\w*\Z/ }
  validates :password, presence: true,
                       length: { minimum: 6 },
                       allow_nil: true
  validates :accepts_terms_of_use,
                       inclusion: { in: ["1", true], message: "must be accepted" }
end
