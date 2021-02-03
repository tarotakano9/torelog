class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string       :training,  null: false
      t.float        :weight,    null: false
      t.integer      :rep,       null: false
      t.integer      :set,       null: false
      t.references   :day,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
