class Message < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :context, presence: true
end
