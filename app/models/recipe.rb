class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  has_many :steps
  has_many :materials
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  mount_uploader :image, ImageUploader
end
