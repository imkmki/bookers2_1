class User < ApplicationRecord
  # Deviseの認証機能
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  # Bookとの関連付け（1:N）
  has_many :books, dependent: :destroy

  # プロフィール画像（ActiveStorage）
  has_one_attached :profile_image

  # バリデーション
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

end
