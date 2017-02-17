class Review < ActiveRecord::Base

    belongs_to :product

    validates :rating, :product_id, :user_id, presence: true
end
