class Customer < ApplicationRecord
	has_many :orders, dependent: :destroy

	validates :name, presence: true

	 validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }

  	validates :phone,
            presence: true,
            uniqueness: true


    scope :city, ->(city){where("LOWER(CITY) ILIKE ?", city)}
    scope :vip, ->{where(vip: true)}

end