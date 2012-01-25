class Purchase < ActiveRecord::Base
  belongs_to :offer
  belongs_to :buyer, :class_name => "Person", :foreign_key => "person_id"
  belongs_to :product
  validates :quantity,  :presence => true
  validates :product,  :presence => true

  def price
    return product.price * quantity
  end

end
