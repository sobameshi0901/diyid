class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_many :steps
  has_many :materials
  has_many :favorites
  has_many :recipes, through: :favorites

  validates :name, :image, :comment, :category, presence: true
  accepts_nested_attributes_for :steps, allow_destroy: true, reject_if: :reject_steps
  # proc { |attributes| attributes['content'].blank? }
  accepts_nested_attributes_for :materials, allow_destroy: true, reject_if: :reject_materials
  # proc { |attributes| attributes['name'].blank? }
  
  mount_uploader :image, ImageUploader

  def reject_steps(attributes)
    exists = attributes[:id].present?
    empty = attributes[:content].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

  def reject_materials(attributes)
    exists = attributes[:id].present?
    empty = attributes[:name].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

end
