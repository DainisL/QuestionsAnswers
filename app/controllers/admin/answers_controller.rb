class Admin::AnswersController < Admin::AdministratorController
  layout "admin"
  # GET /answers
  
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

    respond_to do |format|
      format.html # new.html.erb
     
    end
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
        format.html { redirect_to [:admin ,@answer], notice: 'Answer was successfully created.' }
        
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

    respond_to do |format|
      format.html { redirect_to answers_url }
      
    end
  end
end
