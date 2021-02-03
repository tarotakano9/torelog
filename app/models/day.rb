class Day < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :logs, dependent: :destroy
end
