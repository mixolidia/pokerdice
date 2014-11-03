class Die

  FACES = %w[ 9 T J Q K A ]
  # %w ruby short hand for an array of strings separted by a space

  attr_reader :top_face

  def initialize(dice)
    @dice = dice
    roll
  end

  def roll
    @top_face = FACES[ rand(0..5) ]
  end

end
