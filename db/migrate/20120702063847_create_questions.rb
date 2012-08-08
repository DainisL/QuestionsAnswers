class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :title
      t.integer :survey_id
      t.integer :answer_id
      t.text :question
      t.text :possible_answers
      t.string :answer_type
      t.datetime :create_date
      t.timestamps
    end
  end
  def self.down
    
    drop_table :questions
    
  end
end
