class Category < ApplicationRecord
  has_many :recipes
  belongs_to :largeCategory
end
