class OoutputSerializer < ActiveModel::Serializer
  attributes :id, :ooutput, :user_id, :title, :input_id, :user, :input, :stars, :n, :symmetry, :ground, :periodic_input, :periodic_output, :input_username

  def user
    object.user
  end

  def input
    object.input
  end

  def stars
    object.stars
  end

  def input_username
    object.input.user.username
  end
end
