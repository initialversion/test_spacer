class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :comments,
             :source => :user

  # Validations

end
