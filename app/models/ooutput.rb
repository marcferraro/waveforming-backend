class Ooutput < ApplicationRecord
    belongs_to :input
    belongs_to :user
    # has_many :stars


    mount_uploader :ooutput, OoutputUploader
end
