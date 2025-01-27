class User < ApplicationRecord
    has_one_attached :user_avatar

    belongs_to :category
end
