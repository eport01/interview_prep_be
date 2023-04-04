class AddDefaultToTodos < ActiveRecord::Migration[5.2]
  def change
    change_column_default :todos, :status, 1
  end
end
