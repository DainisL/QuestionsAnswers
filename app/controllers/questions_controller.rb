class QuestionsController < ApplicationController
  
  before_filter :current_user
  helper_method :chek 

  # GET /questions
  def index
     @questions = Survey.find(params[:survey_id]).questions

   end
 

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end
  
end
