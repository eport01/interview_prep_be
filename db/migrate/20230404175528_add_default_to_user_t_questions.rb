class AddDefaultToUserTQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_t_questions, :status, 1

  end
end
