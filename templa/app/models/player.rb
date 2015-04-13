class Player < ActiveRecord::Base
  belongs_to :team

  enum positions:[:goal_keeper,:defense,:midfielder,:forward]

  validates :name, presence: true, length:{minimum:3, maximum: 100}
  validates :age, presence:true, numericality: {only_integer:true,less_than_or_equal_to:50}
  validates :lastname, presence:true , length:{minimum:3, maximum: 100}
  validates :salary, presence:true, numericality: {only_integer: true, less_than_or_equal_to: 9999999999}
  validates_date_of :birthdate, before_or_equal_to: Proc.new { Time.now}
  validates :position, inclusion: { in: Player.positions.keys}

end
