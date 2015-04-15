class TeamSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id,:name,:picture,:creation_date

  has_many :players
end
