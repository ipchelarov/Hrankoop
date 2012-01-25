class Farm < ActiveRecord::Base
  # association to add products to the farm. use
  # @farm.products.create
	has_many :products, :dependent => :destroy
	belongs_to :owner, :class_name => 'Person', :foreign_key => 'person_id'
	
	mount_uploader :picture, PictureUploader
end
