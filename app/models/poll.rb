class Poll < ActiveRecord::Base

  belongs_to :created_by, class: User
  has_many :choices, inverse_of: :poll

  validates :question, presence: true
end
