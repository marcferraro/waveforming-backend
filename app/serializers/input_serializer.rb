class InputSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :input, :username

  def username
    object.user.username
  end
end
