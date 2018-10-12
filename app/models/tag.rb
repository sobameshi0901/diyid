class Tag < ApplicationRecord
<<<<<<< HEAD
  has_many :tag_maps, dependent: :destroy
  has_many :recipes, through: :tag_maps
  validates :name, presence: true

  def self.set_tags(params)
    tag_lists = []
    params.each do |tag_array|
      # tag_arrayは[ 0, "タグの名前" ]が入っている
      tag_name = tag_array[1]
      unless tag_name == nil
        tag = Tag.where(name: tag_name).first_or_initialize
        tag.save
        tag_lists << tag
      end
    end
    return tag_lists
  end
=======
  has_many :tag_maps dependent: :destroy
  has_many :recipes, through: :tag_maps
>>>>>>> 14b047c9f56e313b58411cc4e85ff311d324e273
end
