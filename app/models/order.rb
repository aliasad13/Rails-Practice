class Order < ApplicationRecord
  belongs_to :customer

  STATUSES = %W[pending completed cancelled refunded].freeze

  validates :quantity,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

validates :price,
            presence: true,
            numericality: {
              greater_than: 0
            }

validates :status,
          presence: true,
          inclusion: {
            in: STATUSES
          }

          
end