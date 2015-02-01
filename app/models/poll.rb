class Poll < ActiveRecord::Base

  belongs_to :created_by, class: User
  has_many :choices, inverse_of: :poll

  accepts_nested_attributes_for :choices

  validates :question, presence: true
end
