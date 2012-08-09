module QuestionsHelper
	
	def is_answered?(question_id)
    	Question.find(question_id).answers.where(["user_id >= ?", current_user.id]).count
 	end
end
