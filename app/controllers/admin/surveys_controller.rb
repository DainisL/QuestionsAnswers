class Admin::SurveysController < Admin::AdministratorController
	
	layout "admin"

  def index
    @surveys = Survey.all
    @questions = Question.all
  end

  # GET /surveys/1
  def show
    @survey = Survey.find(params[:id])
    @answers = Answer.all

    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new


    respond_to do |format|
      format.html # new.html.erb
      
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to [:admin, @survey], notice: 'Survey was successfully created.' }
        
      else
        format.html { render action: "new" }
        
      end
    end
  end

  # PUT /surveys/1

  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to [:admin, @survey], notice: 'Survey was successfully updated.' }
        
      else
        format.html { render action: "edit" }
        
      end
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, surveys_url] }
    
    end
  end
  
end
