class Team < ActiveRecord::Base

  validates :name, presence: true, length: {minimum: 3, maximum: 100}
  validates :picture, presence: false , length: {minimum: 5, maximum: 100}
  validates_date_of :creation_date, presence: true
end
