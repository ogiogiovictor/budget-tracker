class Expense < ApplicationRecord

    #Validation
    validates :name, presence: true, allow_blank: false
    validates :amount, presence: true, allow_blank: false
    validates :category_id, presence: true, allow_blank: false
    #validates :date_of_expense, presence: true, allow_blank: false
    

    belongs_to :user, class_name: 'User'
    belongs_to :category, class_name: 'Category'

    def amount
        "₦%.2f" % self[:amount] if self[:amount]
     end

end

