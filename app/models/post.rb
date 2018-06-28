class Post < ApplicationRecord
  
  validates :name, {presence: true,length: {maximum: 20}}
  validates :purpose,{length: {maximum: 50}}
  validates :limit, {presence: true}
  
end
