class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :user_likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  # Validations for presence
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :taken_at, presence: true
  validates :tags, presence: true

  # Validations for length
  validates :title, length: { minimum: 3, maximum: 100 }
  validates :description, length: { minimum: 10, maximum: 1000 }

  # Validation for numericality of likes
  validates :likes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Custom validations
  validate :taken_at_must_be_a_valid_datetime
  validate :taken_at_cannot_be_in_the_future

  # Virtual attribute for tags input
  attr_accessor :tags_input

  before_validation :process_tags_input

  private

  def taken_at_must_be_a_valid_datetime
    unless taken_at.is_a?(ActiveSupport::TimeWithZone) || taken_at.is_a?(Time)
      errors.add(:taken_at, "must be a valid datetime")
    end
  rescue ArgumentError
    errors.add(:taken_at, "must be a valid datetime")
  end

  def taken_at_cannot_be_in_the_future
    errors.add(:taken_at, "cannot be in the future") if taken_at.present? && taken_at > Time.current
  end

  def process_tags_input
    self.tags = tags_input.strip if tags_input.present?
  end
end
