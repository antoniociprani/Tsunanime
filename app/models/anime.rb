class Anime < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_one_attached :image
    acts_as_favoritable
end
