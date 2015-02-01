class Poll < ActiveRecord::Base

  belongs_to :created_by, class: User

  validates :question, presence: true
end
