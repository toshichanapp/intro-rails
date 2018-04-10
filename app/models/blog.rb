class Blog < ApplicationRecord

    belongs_to :user
    has_many :users, through: :favorites
    has_many :favorites, dependent: :destroy

    validates :title, presence:true
    validates :content, presence:true, length: { in: 1..140 }
end
