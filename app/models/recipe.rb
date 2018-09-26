class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  has_many :steps
  has_many :materials
  validates :name, :image, :comment, :category, presence: true
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  accepts_nested_attributes_for :materials, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  
  mount_uploader :image, ImageUploader
end
