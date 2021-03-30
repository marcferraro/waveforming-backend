class CreateColors < ActiveRecord::Migration[6.1]
  def change
    create_table :colors do |t|
      t.string :hex
      t.integer :input_id

      t.timestamps
    end
  end
end
