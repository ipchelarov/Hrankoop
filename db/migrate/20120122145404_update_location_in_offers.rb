class UpdateLocationInOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.rename(:locaton, :location)
    end
  end

  def self.down
    change_table :offers do |t|
      t.rename(:location, :locaton)
    end
  end
end
