class Company < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :stocks
    has_many :products
end
