class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  has_many :steps
  has_many :materials
  mount_uploader :image, ImageUploader
end
