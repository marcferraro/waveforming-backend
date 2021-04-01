class OoutputSerializer < ActiveModel::Serializer
  attributes :id, :ooutput, :user_id, :title, :input_id, :user, :input

  def user
    object.user
  end

  def input
    object.input
  end

  def star
    object.stars
  end
end
