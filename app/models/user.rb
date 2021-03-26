class User < ApplicationRecord
    
    has_secure_password
    validates :username, presence: true, uniqueness: true
    # validates :password, presence: true

    mount_uploader :avatar, AvatarUploader
end
