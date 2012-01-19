class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :picture
      t.references :farm
      t.string :season

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
