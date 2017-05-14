class ChangeColumnNull < ActiveRecord::Migration[5.0]
  def change
  	change_column_null(:sports, :name, false)
  end
end
