class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :status, null: false, default: "todo"
      t.date :date, default: Date.today

      t.timestamps
    end
  end
end
