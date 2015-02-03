class Poll < ActiveRecord::Base

  belongs_to :created_by, class: User
  has_many :choices, inverse_of: :poll

  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :question, presence: true
  validate :at_least_two_choices

  private

  def at_least_two_choices
    unless choices.reject(&:destroyed?).count > 1
      errors.add(:base, "Must have at least two choices")
    end
  end
end
