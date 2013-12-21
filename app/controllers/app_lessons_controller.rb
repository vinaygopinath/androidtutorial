class AppLessonsController < ApplicationController
  layout "syndicate"

  before_filter :authenticate_user!, except: [:incoming, :landing_page]

  def lesson_with_token
	 @app_name = params[:app_name]
	 @lessons = AppLesson.includes(:progresses)
	 @current_lesson = AppLesson.find_by_token(params[:token])
	 @next_lesson = AppLesson.find_by_number(@current_lesson.number + 1)
	 current_user_lesson_entry = CurrentUserLesson.find_by_user_id_and_lesson_number(current_user.id,@current_lesson.number) 

	 if params[:done] and !current_user_lesson_entry.nil? and current_user_lesson_entry.completed == true
		 @done = true
	 else
		 user_lesson = CurrentUserLesson.find_or_create_by_user_id(current_user.id)
		 user_lesson.lesson_number = @current_lesson.number
		 user_lesson.completed = false
		 user_lesson.save
		 @done = false
	 end

	 @progress_percent = Progress.where( user_id: current_user.id).length * 100 / AppLesson.all.length
		
	 render :lesson and return
  end

  def landing_page
	  #progress = Progress.where(user_id: current_user.id).order("lesson_number desc")
	  #@current_lesson = progress.empty? ? AppLesson.first : AppLesson.find_by_number(progress[0].lesson_number + 1)
	  #redirect_to app_tutorial_lesson_with_token_path(params[:app_name],@current_lesson.token)
  end


end

