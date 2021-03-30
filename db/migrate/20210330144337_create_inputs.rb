class CreateInputs < ActiveRecord::Migration[6.1]
  def change
    create_table :inputs do |t|
      t.string :title
      t.integer :user_id
      t.string :input

      t.timestamps
    end
  end
end
