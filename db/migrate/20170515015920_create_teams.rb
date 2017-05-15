class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.belongs_to :sport, index: true
      t.string :city, null: false
      t.string :mascot, null: false

      t.timestamps
    end
  end
end
