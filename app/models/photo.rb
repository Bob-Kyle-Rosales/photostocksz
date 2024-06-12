class Photo < ApplicationRecord
    has_one_attached :image
    
    # Validation for presence of title, description, and category
    validates :title, :description, :category, presence: true
  
    # Validation for minimum and maximum length of title and description
    validates :title, length: { minimum: 3, maximum: 100 }
    validates :description, length: { minimum: 10, maximum: 1000 }
  
    # Validation for numericality of likes attribute (must be an integer)
    validates :likes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  