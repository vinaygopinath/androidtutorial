class AppLessonsController < ApplicationController
  layout "syndicate"

  before_filter :authenticate_user!

  def lesson
  end

end

