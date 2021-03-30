class User < ApplicationRecord
    has_many :inputs
    has_many :ooutputs
    has_many :stars
    
    has_secure_password
    validates :username, presence: true, uniqueness: true
    # validates :password, presence: true

    mount_uploader :avatar, AvatarUploader
end
