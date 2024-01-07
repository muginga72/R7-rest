class RemoveFactIdFromFacts < ActiveRecord::Migration[7.0]
  def change
    remove_column :facts, :factID, :string
  end
end
