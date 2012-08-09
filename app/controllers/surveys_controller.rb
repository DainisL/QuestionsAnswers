class SurveysController < ApplicationController
 
before_filter :current_user
  
  # GET /surveys
    def index
    @surveys = Survey.all
     
      
    end
  end

  # GET /surveys/1
  def show
    @survey = Survey.find(params[:id])
  end
end
