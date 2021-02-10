class Day < ApplicationRecord
  # バリデーション
  validates :date, presence: true
  validates :date, presence: true

  with_options inclusion: {in: [true, false]} do
    validates :chest
    validates :shoulder
    validates :tricep
    validates :bicep
    validates :back
    validates :abdominal
    validates :leg
  end

  validates_with AnyoneValidator
  
  # アソシエーション
  belongs_to :user
  has_many :logs, dependent: :destroy
  accepts_nested_attributes_for :logs, reject_if: :all_blank, allow_destroy: true
end
