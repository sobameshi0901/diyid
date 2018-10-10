class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :recipes, through: :tag_maps
  validates :name, presence: true

  def self.register_tag(params)
    params.each do |tag_array|
      # tag_arrayは[ 0, "タグの名前" ]が入っている
      unless Tag.exists?(name: tag_array[1]) || tag_array[1] == nil
        Tag.create(name: tag_array[1])
      end
    end
  end
end
