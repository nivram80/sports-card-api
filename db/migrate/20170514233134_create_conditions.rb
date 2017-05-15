class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.string :grade, null: false

      t.timestamps
    end
  end
end
