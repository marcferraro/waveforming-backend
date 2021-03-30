class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :avatar, :ooutputs

  def ooutputs
    object.ooutputs
  end
end
