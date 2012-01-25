class AddOwnerToFarms < ActiveRecord::Migration
  def self.up
    change_table :farms do |t|
      t.remove :owner
      t.references :person
    end
  end

  def self.down
    change_table :farms do |t|
      t.remove :person_id
      t.string :owner
    end
  end
end
