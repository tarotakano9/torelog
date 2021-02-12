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

  # 検索のため
  scope :search, -> (search_params) do
    return if search_params.blank?

    date_from(search_params[:date_from])
      .date_to(search_params[:date_to])
      .chest_is(search_params[:chest])
      .shoulder_is(search_params[:shoulder])
      .tricep_is(search_params[:tricep])
      .bicep_is(search_params[:bicep])
      .back_is(search_params[:back])
      .abdominal_is(search_params[:abdominal])
      .leg_is(search_params[:leg])
  end
  scope :date_from, -> (from) { where('? <= date', from) if from.present? }
  scope :date_to, -> (to) { where('date <= ?', to) if to.present? }
  scope :chest_is, -> (chest) { where(chest: chest) if chest.present? }
  scope :shoulder_is, -> (shoulder) { where(shoulder: shoulder) if shoulder.present? }
  scope :tricep_is, -> (tricep) { where(tricep: tricep) if tricep.present? }
  scope :bicep_is, -> (bicep) { where(bicep: bicep) if bicep.present? }
  scope :back_is, -> (back) { where(back: back) if back.present? }
  scope :abdominal_is, -> (abdominal) { where(abdominal: abdominal) if abdominal.present? }
  scope :leg_is, -> (leg) { where(leg: leg) if leg.present? }
end
