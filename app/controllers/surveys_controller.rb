class SurveysController < ApplicationController
 
before_filter :current_user
  
  # GET /surveys
    def index
    @surveys = Survey.all
    @questions = Question.all
     

    respond_to do |format|
      format.html # index.html.erb
      
    end
  end

  # GET /surveys/1
  def show
    @survey = Survey.find(params[:id])
    @answers = Answer.all

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end
end
