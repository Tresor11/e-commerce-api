class Item < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates_presence_of :name, :description, :price, :contact, :image
  validates_uniqueness_of :description
  mount_uploader :image, ImageUploader

  #query all items that have been favorited by any user
  # def self.favorited
  #   joins(:favorites).group('items.id')
  # end

  def self.favorited(user)
    joins(:favorites).where(user_id: user.id).group('items.id')
  end
end
