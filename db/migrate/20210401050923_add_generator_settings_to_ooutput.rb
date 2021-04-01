class AddGeneratorSettingsToOoutput < ActiveRecord::Migration[6.1]
  def change
    add_column :ooutputs, :n, :integer
    add_column :ooutputs, :symmetry, :integer
    add_column :ooutputs, :ground, :integer
    add_column :ooutputs, :periodic_input, :boolean
    add_column :ooutputs, :periodic_output, :boolean
  end
end
