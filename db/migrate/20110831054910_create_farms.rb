class CreateFarms < ActiveRecord::Migration
  def self.up
    create_table :farms do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.string :owner
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :farms
  end
end
