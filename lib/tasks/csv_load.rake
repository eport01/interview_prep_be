require 'csv'

namespace :csv_load do 
  task b_questions: :environment do 
    CSV.foreach('./db/data/b_questions.csv', headers: true) do |row|
      BQuestion.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('b_questions')
  end

  task t_questions: :environment do 
    CSV.foreach('./db/data/t_questions.csv', headers: true) do |row|
      TQuestion.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('t_questions')

  end


  task delete: :environment do 
    BQuestion.destroy_all 
    TQuestion.destroy_all 
  end
end