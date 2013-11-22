class ConceptLessonsController < ApplicationController
  layout "syndicate"

  def index
  end

  def view
	  render params[:template] and return
  end
end
