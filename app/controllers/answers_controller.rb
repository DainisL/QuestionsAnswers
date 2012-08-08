class AnswersController < ApplicationController
  # GET /answers
  before_filter :current_user
  
  def index
    @questions = Survey.find(params[:survey_id]).questions
  end

  # GET /answers/1
    def show
    @answer = Answer.find(params[:id])
    @question = @answer.question

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id]) 
    current_user
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  # POST /answers
  def create
    @answer = Answer.new(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        
      else
        format.html { render action: "new" }
        
      end
    end
  end

  # PUT /answers/1
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        
      else
        format.html { render action: "edit" }
        
      end
    end
  end

  # DELETE /answers/1
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

  end
  
end
