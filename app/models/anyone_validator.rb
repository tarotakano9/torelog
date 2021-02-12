class AnyoneValidator < ActiveModel::Validator
  def validate(day)
    targets = [day.chest, day.shoulder, day.tricep, day.bicep, day.back, day.abdominal, day.leg]
    
    return if targets.include?(true)
    day.errors.add(:base, "ターゲットをどれか1つは選択してください。")
  end
end