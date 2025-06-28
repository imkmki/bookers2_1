class Book < ApplicationRecord
  belongs_to :user

  # バリデーション（次のステップで追加してもOK）
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
