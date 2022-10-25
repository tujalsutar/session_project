class Post < ApplicationRecord
  belongs_to :user
  # has_one_attached :avatar
  # has_one_attached :song_file
  has_one_attached :image

  # has_many_attached :

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
end
