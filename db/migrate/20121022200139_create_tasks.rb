class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :user
      t.datetime :due_at
      t.integer :priority, default: 0
      t.boolean :completed, default: false

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
