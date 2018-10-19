class Question < ApplicationRecord
  belongs_to :recipe
  has_many :messages, dependent: :destroy
end
