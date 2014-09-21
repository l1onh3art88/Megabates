class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      add_colum :name
      t.timestamps
    end
  end
end
