class Comment < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :item 
  belongs_to :user 
end
