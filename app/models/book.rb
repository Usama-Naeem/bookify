class Book < ApplicationRecord
  validates :book_img, presence: true
  validates :isbn, uniqueness: true
  validate :isbn_length
  belongs_to :user
  has_many :reviews
  has_one_attached :book_img
  has_and_belongs_to_many :categories

  def isbn_length
    unless isbn.size == 10 or isbn.size == 13
      errors.add(:isbn, "ISBN should be 10 or 13 characters long")
    end
  end
end
