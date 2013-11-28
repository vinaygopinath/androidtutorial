class CreateCurrentUserLessons < ActiveRecord::Migration
  def change
    create_table :current_user_lessons do |t|
      t.integer :user_id
      t.integer :lesson_number
      t.boolean :completed

      t.timestamps
    end
  end
end
