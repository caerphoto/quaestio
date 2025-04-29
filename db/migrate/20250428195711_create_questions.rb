class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.boolean :open
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
