class InputSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :input, :user, :username, :colors

  def username
    object.user.username
  end

  def user
    object.user
  end

  def colors
    object.colors
  end
end
