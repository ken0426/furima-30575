class ItemForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postalcode, :area_id, :municipality, :address, :building, :phone, :token

  with_options presence: true do
   validates :token
   validates :item_id
   validates :user_id
   validates :postalcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input half-width characters."}
   validates :municipality
   validates :address
   validates :area_id, numericality: { other_than: 1 } 
   validates :phone, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

    def save
      order = Order.create(
        item_id: item_id, 
        user_id: user_id
      )
      Address.create(
        postalcode: postalcode, 
        area_id: area_id, 
        municipality: municipality, 
        address: address, 
        building: building, 
        phone: phone, 
        order_id: order.id)
    end
end