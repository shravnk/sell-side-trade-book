class BondSerializer < ActiveModel::Serializer
  attributes :id
  has_many :transacts
end
