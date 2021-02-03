class Day < ApplicationRecord
  # バリデーション
  validates :date, presence: true

  with_options inclusion: {in: [true, false]} do
    validates :target_exists
    validates :chest
    validates :shoulder
    validates :tricep
    validates :bicep
    validates :back
    validates :abdominal
    validates :leg
  end
  
  # アソシエーション
  belongs_to :user
  has_many :logs, dependent: :destroy
end
