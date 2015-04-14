class PlayerSerializer < ActiveModel::Serializer
  attributes :id,:name,:age,:lastname,:salary,:birthdate,:position,:status,:team_id
end
