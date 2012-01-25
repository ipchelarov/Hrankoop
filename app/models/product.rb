class Product < ActiveRecord::Base
  belongs_to :farm
  has_and_belongs_to_many :offers
  mount_uploader :picture, PictureUploader
end
