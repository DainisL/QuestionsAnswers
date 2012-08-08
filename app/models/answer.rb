class Answer < ActiveRecord::Base
  attr_accessible :answer, :create_date, :question_id ,:user_id

  	validates :answer, :presence => true
  	validates :question_id, :presence => true
  	validates :create_date, :presence => true


  belongs_to :question
  belongs_to :user
  
end
