class OoutputSerializer < ActiveModel::Serializer
  attributes :id, :ooutput, :user_id, :title, :input_id, :user, :input, :stars

  def user
    object.user
  end

  def input
    object.input
  end

  def stars
    object.stars
  end
end
