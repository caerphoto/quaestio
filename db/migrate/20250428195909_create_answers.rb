class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.integer :amount, null: false
      t.boolean :approved, null: false, default: false

      t.timestamps
    end

    create_table :answers do |t|
      t.text :body
      t.references :user, null: true, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :payment, null: true, foreign_key: true

      t.timestamps
    end
  end
end
