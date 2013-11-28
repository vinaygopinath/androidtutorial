class CreateAppLessonUserStatuses < ActiveRecord::Migration
  def change
    create_table :app_lesson_user_statuses do |t|
      t.integer :user_id
      t.integer :lesson_number

      t.timestamps
    end
  end
end
