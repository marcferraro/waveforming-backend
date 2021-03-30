class Input < ApplicationRecord
    belongs_to :user

    mount_uploader :input, InputUploader
end
