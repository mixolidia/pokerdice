require_relative 'die'

FACES = %w[ 9 T J Q K A ]

describe Die do
  specify "roll" do
    @die=Die.new
    @die.top_face.should satisfy { |p| FACES.include? (p)  }
  end
end
