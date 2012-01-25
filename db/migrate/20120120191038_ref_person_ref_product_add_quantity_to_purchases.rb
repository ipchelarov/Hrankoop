class RefPersonRefProductAddQuantityToPurchases < ActiveRecord::Migration
  def self.up
    change_table :purchases do |t|
      t.remove :buyer
      t.references :person
      t.references :product
      t.float :quantity
    end
  end

  def self.down
    change_table :purchases do |t|
      t.remove :quantity
      t.remove :product_id
      t.remove :person_id
      t.string :buyer
    end
  end
end
