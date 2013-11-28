class AppLesson < ActiveRecord::Base
	has_many :progresses, foreign_key: :lesson_number, primary_key: :number
end
