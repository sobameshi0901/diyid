class Category < ApplicationRecord
  has_many :recipes
  belongs_to :large_category, optional: true;
end
