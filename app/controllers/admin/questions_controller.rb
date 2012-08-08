class Admin::QuestionsController < Admin::AdministratorController
  
layout "admin"
  
  # GET /questions
  def index
   @questions = Survey.find(params[:survey_id]).questions
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
    @survey = Survey.find(params[:survey_id])
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
    @survey = Survey.find(params[:survey_id])
  end

  # POST /questions
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to [:admin ,@question], notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /questions/1
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to [:admin, @question], notice: 'Question was successfully updated.' }
      else
        format.html { render action: "edit" }
     
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, questions_url] }
      
    end
  end
end
