class AddInputIdToOoutput < ActiveRecord::Migration[6.1]
  def change
    add_column :ooutputs, :input_id, :integer
  end
end
