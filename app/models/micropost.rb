class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :purpose,{length: {maximum: 50}}
  validates :limit, {presence: true}
end
