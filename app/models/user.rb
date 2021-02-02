class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:nickname]

  # 正規表現
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  # バリデーション
  validates :nickname, presence: true, uniqueness: true, length: { in: 4..20 }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true

  #usernameを必須とする
  # validates_uniqueness_of :nickname
  # validates_presence_of :nickname

  #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["nickname = :value", { :value => nickname }]).first
    else
      where(conditions).first
    end
  end

# No use email
  def email_required?
    false
  end
  def email_changed?
    false
  end
  def will_save_change_to_email?
    false
  end
end
