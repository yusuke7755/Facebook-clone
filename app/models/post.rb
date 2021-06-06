class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    validates :image, presence: true
    validates :content, presence: true, length: { in: 1..200 }
end
