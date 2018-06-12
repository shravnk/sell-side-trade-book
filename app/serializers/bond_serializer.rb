class BondSerializer < ActiveModel::Serializer
  attributes :id, :description
  # has_many :transacts

  def description
  	object.print_description
  end
end
