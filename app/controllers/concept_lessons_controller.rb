class ConceptLessonsController < ApplicationController
  layout "syndicate"

  def index
  end

  def view
	  @template = "concept_lessons/#{params[:template].gsub('-','_')}"
  end
end
