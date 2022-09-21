class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :zip, :prefecture_id, :city, :address1, :address2, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address1
    validates :telephone, length: {minimum: 10, maximum: 11}, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create!(order_id: order.id, zip: zip, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2,
                   telephone: telephone)
  end
end
