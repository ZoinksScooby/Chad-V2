class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :id
      t.string :name
      t.timestamps
    end
  end
end
