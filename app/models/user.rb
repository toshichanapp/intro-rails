class User < ApplicationRecord

  mount_uploader :icon, IconUploader

  has_many :blogs
  has_many :favorites

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  before_save { email.downcase! }
end
