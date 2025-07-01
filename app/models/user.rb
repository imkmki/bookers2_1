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

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    where(name: conditions[:name]).first
  end

end
