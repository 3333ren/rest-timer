class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :alarms
  has_many :memos

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'include both letters and numbers'}
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'は日本語のみを入力してください' }
    validates :age, format: { with: /\A[0-9]+\z/, message: 'は半角数字のみを入力してください' }
  end
end