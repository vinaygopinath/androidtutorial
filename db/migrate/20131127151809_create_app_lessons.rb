class CreateAppLessons < ActiveRecord::Migration
  def change
    create_table :app_lessons do |t|
      t.integer :number
      t.string :file
      t.string :title
      t.string :token

      t.timestamps
    end
  end
end
