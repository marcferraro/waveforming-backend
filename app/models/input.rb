class Input < ApplicationRecord
    belongs_to :user
    has_many: colors

    mount_uploader :input, InputUploader
end
