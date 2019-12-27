class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.boolean :answered, null: false, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
