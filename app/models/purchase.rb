class Purchase < ActiveRecord::Base
  belongs_to :offer
  has_many :goods
end
