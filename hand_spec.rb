require_relative 'hand'
require_relative 'loaded_die'

describe Hand do
  def hand_with(face_values)
    # what we started with
    # dice = face_values.map { |value|
    #   LoadedDie.new(value)
    # }

    dice = face_values.map {  |value|
      double("Die", :face_value => value) \
        .tap { |double | p [double, double.face_value] }
    }
    hand = Hand.new(dice)

  it "has five dice, each of which has a known face value" do
    dice = 5.times.map { LoadedDie.new('Q') }
    hand = Hand.new(dice)
    expect(hand.face_values).to eq( %w[ Q Q Q Q Q ])
  end

  specify "a Hand with five Queens is ranked as 'five of a kind'" do
    dice = %w[ Q Q Q Q Q ].map { |value| LoadedDie.new(value) }
    hand = Hand.new(dice)
    expect(hand.rank).to eq('five of a kind')
  end

  specify "a bupkis is ranked as 'bupkis'" do
    dice = %w[ 9 T J Q A].map { |value| LoadedDie.new(value) }
    hand = Hand.new(dice)
    expect(hand.rank).to eq('bupkis')
  end

  specify "a Hand with one of each is ranked as 'straight hand'" do
    dice = %w[ T J Q K A ].map { |value| LoadedDie.new(value) }
    hand = Hand.new(dice)
    expect(hand.rank).to eq('straight hand')
  end

end
