class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :comments

  with_options presence: true do
    validates :information
    validates :title
    validates :price, numericality: { only_integer: true, message: 'must be half-width number' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    validates :image

    validates :category_id, numericality: { other_than: 1}
    validates :quality_id, numericality: { other_than: 1}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :shipment_day_id, numericality: { other_than: 1}
    validates :post_price_id, numericality: { other_than: 1}
  end

  belongs_to :category
  belongs_to :quality
  belongs_to :shipment_day
  belongs_to :prefecture
  belongs_to :post_price

  def self.search(search)
    if search != ""
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
