class Log < ApplicationRecord
  # バリデーション
  with_options presence: true do
    validates :training
    validates :weight
    validates :rep
    validates :set
  end

  # アソシエーション
  belongs_to :day
end
