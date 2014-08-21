class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :fact, index: true

      t.timestamps
    end
  end
end
