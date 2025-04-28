class AddCategoryToQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
    end

    add_reference :questions, :category, null: false, foreign_key: true
  end
end
