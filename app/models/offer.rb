class Offer < ActiveRecord::Base
  validates :title,  :presence => true
  has_and_belongs_to_many :products
  has_many :purchases

  def buyers
    @buyers = Array.new
    purchases.each do |purch|
      @buyers.push(purch.buyer)
    end
    return @buyers.uniq!
  end

  def purchases_by_buyer(b)
    purchases.where(:person_id => b)
  end

  def prices
    prices = {}
    buyers = buyers()
    buyers.each do |b|
      prices[b] = 0
      purchases = purchases_by_buyer(b)
      purchases.each do |p|
        prices[b] += p.price
      end
    end
    
    return  prices
  end

  def purchase_matrix
    matrix = {}
    purchases.each do |p|
      bp = matrix[p.buyer.id]
      if (bp.nil?)
        bp = { p.product.id => p.quantity }
        matrix[p.buyer.id] = bp
      else
        bp[p.product.id] = p.quantity
      end
    end
    return matrix
  end

end
