class CreateUserTQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_t_questions do |t|
      t.references :user, foreign_key: true
      t.references :t_question, foreign_key: true
      t.string :answer
      t.integer :status

      t.timestamps
    end
  end
end
