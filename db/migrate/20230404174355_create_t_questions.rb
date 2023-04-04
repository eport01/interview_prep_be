class CreateTQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :t_questions do |t|
      t.string :question
      t.integer :q_type

      t.timestamps
    end
  end
end
