class Song < ApplicationRecord
  has_many :songs_users
  has_many :users, through: :songs_users
  # has_and_belongs_to_many :users
  belongs_to :artist
end
