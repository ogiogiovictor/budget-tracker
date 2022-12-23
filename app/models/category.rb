class Category < ApplicationRecord

   # validates :name, presence: true, allow_blank: false
    validates :name, presence: true, uniqueness: { scope: :user_id }

    has_many :expenses, foreign_key: :category_id, dependent: :destroy
    belongs_to :user, class_name: 'User'

    has_one_attached :image
    

    def image_as_thumbnail
        image.variant(resize_to_limit: [50, 50]).processed
    end
end