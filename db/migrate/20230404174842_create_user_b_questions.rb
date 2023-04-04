class CreateUserBQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_b_questions do |t|
      t.references :user, foreign_key: true
      t.references :b_question, foreign_key: true
      t.string :answer
      t.integer :status

      t.timestamps
    end
  end
end
