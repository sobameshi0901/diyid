class Recipe < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_many :steps
  has_many :materials
  has_many :favorites,dependent: :destroy
  has_many :users, through: :favorites
  has_many :likes,dependent: :destroy
  has_many :users, through: :likes
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

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

  # タグ一覧の配列をeachで回し、それぞれのタグとrecipeのidをTag_mapに登録する
  def register_tags(tag_list)
    tag_list.each do |tag|
      TagMap.create(recipe_id: self.id, tag_id: tag.id)
    end
  end


  def update_tags(tag_list)
    delete_tags = self.tags - tag_list
    new_tags = tag_list - self.tags
    delete_tags.each{|tag| TagMap.find_by(recipe_id: self.id, tag_id: tag.id).delete}
    new_tags.each{|tag| TagMap.create(recipe_id: self.id, tag_id: tag.id)}
  end

end
