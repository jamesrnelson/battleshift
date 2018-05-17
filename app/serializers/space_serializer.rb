class SpaceSerializer < ActiveModel::Serializer
  alias :read_attribute_for_serialization :send
  attributes :coordinates, :status

  def coordinates
    object.name
  end

  def status
    object.status
  end
end
