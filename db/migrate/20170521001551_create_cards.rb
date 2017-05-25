class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :player_id, null: false
      t.integer :team_id, null: false
      t.integer :company_id, null: false
      t.integer :condition_id, null: false
      t.integer :card_number, null: false
      t.string  :year, null: false
      t.boolean :rookie_year, null: false, default: false
      t.boolean :autograph, null: false, default: false
      t.decimal :sale_price
      t.decimal :guide_price

      t.timestamps
    end
  end
end
