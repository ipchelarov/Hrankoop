class Farm < ActiveRecord::Base
  # association to add products to the farm. use
  # @farm.products.create
	has_many :products, :dependent => :destroy
	belongs_to :owner, :class_name => 'Person'
	
	mount_uploader :picture, PictureUploader
end
