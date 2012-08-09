ActiveAdmin.register Question do
	form :partial => "form"

	controller do
      def new
      	 @question = Question.new
      	 @survey = Survey.all
      end
    end

  
end
