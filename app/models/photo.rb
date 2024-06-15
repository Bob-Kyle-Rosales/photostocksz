class Photo < ApplicationRecord
  has_one_attached :image

  # Validation for presence and uniqueness of title
  validates :title,
            presence:   true, # Ensure the title is present
            length:     { minimum: 3, maximum: 100 }, # Ensure the title length is between 3 and 100 characters
            uniqueness: true # Ensure the title is unique

  # Validation for presence, length, and format of description
  validates :description,
            presence: true, # Ensure the description is present
            length:   { minimum: 10, maximum: 1000 }, # Ensure the description length is between 10 and 1000 characters
            format:   { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" } # Ensure the description only contains letters, numbers, and spaces

  # Validation for presence, length, and inclusion of category
  validates :category,
            presence:  true, # Ensure the category is present
            length:    { maximum: 50 }, # Ensure the category length does not exceed 50 characters
            inclusion: { in: %w[Nature Portraits Abstract Urban Other], message: "%<value>s is not a valid category" } # Ensure the category is one of the predefined options

  # Validation for numericality and presence of likes attribute (must be an integer)
  validates :likes,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }, # Ensure likes is an integer and greater than or equal to 0
            presence:     true # Ensure likes is present

  # Validation for presence and that taken_at is a valid datetime
  validates :taken_at,
            presence: true # Ensure taken_at is present
  validate :taken_at_cannot_be_in_the_future  # Custom validation to ensure taken_at is not in the future
  validate :taken_at_must_be_a_valid_datetime # Custom validation to ensure taken_at is a valid datetime

  # Validation for presence, array type, and individual tag length of tags attribute
  validates :tags,
            presence: true # Ensure tags is present
  validate :tags_array_validity               # Custom validation to ensure tags is an array of strings and each tag does not exceed 50 characters
  validate :tags_count_within_limit           # Custom validation to ensure the number of tags does not exceed 10

  private

  # Custom validation to ensure taken_at is not in the future
  def taken_at_cannot_be_in_the_future
    return unless taken_at.present? && taken_at > DateTime.now

    errors.add(:taken_at, "can't be in the future")
  end

  # Custom validation to ensure taken_at is a valid datetime
  def taken_at_must_be_a_valid_datetime
    errors.add(:taken_at, "must be a valid datetime") unless taken_at.is_a?(DateTime)
  end

  # Custom validation to ensure tags is an array of strings
  def tags_array_validity
    unless tags.is_a?(Array)
      errors.add(:tags, "must be an array")
      return
    end

    tags.each do |tag|
      errors.add(:tags, "each tag cannot be more than 50 characters long") if tag.length > 50

      errors.add(:tags, "must be an array of strings") unless tag.is_a?(String)
    end
  end

  # Custom validation to ensure the number of tags does not exceed 10
  def tags_count_within_limit
    return unless tags.is_a?(Array) && tags.size > 10

    errors.add(:tags, "cannot contain more than 10 tags")
  end
end
