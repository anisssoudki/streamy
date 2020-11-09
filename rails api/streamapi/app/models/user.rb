class User < ApplicationRecord
    has_many :streams, dependent: :destroy
    validates :name, presence:true
end
