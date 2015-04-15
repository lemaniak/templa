class PlayerSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id,:name,:age,:lastname,:salary,:birthdate,:position,:status
end