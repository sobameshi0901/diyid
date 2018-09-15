class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  has_many :steps
  has_many :materials
  accepts_nested_attributes_for :steps, :materials
  mount_uploader :image, ImageUploader
end
