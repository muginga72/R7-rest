class AddFactIdToFacts < ActiveRecord::Migration[7.0]
  def change
    add_column :facts, :factID, :string
  end
end
