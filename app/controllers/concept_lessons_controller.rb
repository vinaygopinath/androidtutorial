class ConceptLessonsController < ApplicationController
  def index
  end

  def view
	  render params[:template] and return
  end
end
