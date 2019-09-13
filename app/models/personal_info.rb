class PersonalInfo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  validates :family_name, presence: true, format: {
    with: /\A[一-龥ぁ-ん]/,
    message: "は全角で入力して下さい"
  }
  validates :first_name, presence: true, format: {
    with: /\A[一-龥ぁ-ん]/,
    message: "は全角で入力して下さい"
  }
  validates :family_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナで入力して下さい"
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: "は全角カタカナで入力して下さい"
  }
  validates :postal_code, presence: true, format: {
    with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/,
    message: "はハイフン(-)を含む7桁の半角数値で入力してください"
  }
  validates :prefecture_code, presence: true
  validates :city_code, presence: true
  validates :address_num, presence: true
end
