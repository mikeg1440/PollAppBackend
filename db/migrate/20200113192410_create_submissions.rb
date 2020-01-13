class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.reference :poll
      t.reference :question
      t.reference :answer

      t.timestamps
    end
  end
end
