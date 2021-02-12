class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date        :date,          null: false
      t.boolean     :chest,         default: false, null: false
      t.boolean     :shoulder,      default: false, null: false
      t.boolean     :tricep,        default: false, null: false
      t.boolean     :bicep,         default: false, null: false
      t.boolean     :back,          default: false, null: false
      t.boolean     :abdominal,     default: false, null: false
      t.boolean     :leg,           default: false, null: false
      t.references  :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
