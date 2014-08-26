class FixFacts < ActiveRecord::Migration
  def change
    add_column :facts, :user_id, :integer
    add_column :facts, :topic_id, :integer
    add_column :facts, :opinion, :text
    add_column :facts, :citation, :string
    add_column :facts, :lean, :boolean
  end
end
