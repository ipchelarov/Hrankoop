class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.string :buyer
      t.references :offer

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
