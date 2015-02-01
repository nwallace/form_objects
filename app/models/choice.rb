class Choice < ActiveRecord::Base

  belongs_to :poll, inverse_of: :choices

  validates :poll, presence: true
  validates :text, presence: true
end
