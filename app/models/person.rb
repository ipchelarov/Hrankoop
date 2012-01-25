class Person < ActiveRecord::Base
	has_many :farms
	mount_uploader :picture, PictureUploader
  has_many :purchases
end
