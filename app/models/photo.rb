# app/models/photo.rb
class Photo < ApplicationRecord
  # Attach image using Active Storage
  has_one_attached :image
  
  # Validations for presence
  validates :title, :description, :category, :taken_at, :tags, presence: true

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
    errors.add(:taken_at, "must be a valid datetime") unless taken_at.is_a?(ActiveSupport::TimeWithZone) || taken_at.is_a?(Time)
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
