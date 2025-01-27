class Category < ApplicationRecord
    # before_save :before_save_method
    after_save  :after_save_method

    # before_destroy :before_destroy_method
    # after_destroy :after_destroy_method

    after_update :after_update_method

    after_create :after_create_method

    ### validate ###

    validates :name, presence: true, length: {minimum: 6, maximum: 40}
    validates :parent, presence: true, length: {maximum: 50}
    validates :endpoint, presence: true, length: {minimum: 12} 
    # for numericals
    # validates :id_field, presence: true, numericality: {greater_than_or_equals: 0, less_than: 100}

    # validate :starts_with_a

    has_many :users

    

    def starts_with_a
        if !self.parent.upcase.start_with?("A")
            errors.add(:parent, "must start with A letter.")
        end
    end

    def before_save_method
        p "before save method called"
    end

    def after_save_method
        p "after save method called"
    end

    def before_destroy_method
        p "before destroy method called"
    end

    def after_destroy_method
        p "after destroy method called"
    end

    def after_update_method
        p "after update method called"
    end

    def after_create_method
        p "after create"
    end
end
