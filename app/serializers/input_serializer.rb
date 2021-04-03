class InputSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :input, :username, :colors

  def username
    object.user.username
  end

  def colors
    object.colors
  end
end
