class CreateOoutputs < ActiveRecord::Migration[6.1]
  def change
    create_table :ooutputs do |t|
      t.string :ooutput
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
