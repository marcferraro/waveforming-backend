class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.integer :user_id
      t.integer :ooutput_id

      t.timestamps
    end
  end
end
