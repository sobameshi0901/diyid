class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :recipes, through: :favorites
  has_many :recipes, through: :likes

  has_attached_file :avatar, styles: {medium: "300x300#", humb: "100x100#"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png"]
end
