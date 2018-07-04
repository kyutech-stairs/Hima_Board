class Post < ApplicationRecord
  belongs_to :user
  
  validates :purpose,{length: {maximum: 50}}
  validates :limit, {presence: true}
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }
  
end
