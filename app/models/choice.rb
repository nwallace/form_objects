class Choice < ActiveRecord::Base

  belongs_to :poll

  validates :poll, presence: true, inverse_of: :choices
  validates :text, presence: true
end
