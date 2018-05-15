class User < ApplicationRecord

  mount_uploader :icon, IconUploader

  has_many :blogs
  has_many :favorites
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  # class_name: 'Relationship'
  # Railsのアソシエーションは何もオプションを書かないと、
  # アソシエーション名と同じ名前のテーブルをさがす。
  # テーブルが存在しないアソシエーションを構築する時は、
  # テーブルに紐づくモデル名（Relationship） をclass_nameオプションとして記載
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  before_save { email.downcase! }
end
