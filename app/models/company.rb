class Company < ApplicationRecord
    has_many :users
    has_many :stocks
    has_many :products
end
