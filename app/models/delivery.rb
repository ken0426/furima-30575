class Delivery < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '支払い（購入者負担）' },
    { id: 3, name: '装用込み（出品者負担）' }
  ]
  end