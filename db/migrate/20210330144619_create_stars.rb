class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.string :user_id
      t.string :ooutput_id

      t.timestamps
    end
  end
end
