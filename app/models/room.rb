class Room < ApplicationRecord
  mount_uploader :imagge, ImageUploader

  def self.search_area(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end

  def self.search_keyword(search)
    if search
      Room.where(['name LIKE ? OR introduction LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true

end
