class Review < ApplicationRecord
  validates :rating, :inclusion => { :in => 0..5, :message => " should be between 0 to 5" }
  validates :rating, :presence => { :message => " cannot be blank" }
  validates :comment, length: { maximum: 200 }
  validates :book_id, uniqueness: { scope: :user_id, message: "You've reviewed this movie!" }
  belongs_to :user
  belongs_to :book
end
