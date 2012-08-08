class Question < ActiveRecord::Base
  attr_accessible :answer_type, :create_date, :question, :title, :possible_answers, :survey_id
  	
  validates :answer_type, :presence => true
  validates :create_date, :presence => true
  validates :title, :presence => true
  validates :question, :presence => true
  validates :possible_answers, :presence => true
  


  has_many :answers
  belongs_to :survey
  
  
end
