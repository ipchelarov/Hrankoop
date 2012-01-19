class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :locaton
      t.date :date
      t.string :responsible
      t.references :products

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
