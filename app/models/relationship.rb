class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"

  # 同じテーブルから複数のアソシエーションを定義する時
  # アソシエーション名を変えることで管理する
end
