class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password,
  format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }
  has_many :topics
  has_many :favorites
  has_many :favoritesd
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_secure_password

  # has_many :comments
end
