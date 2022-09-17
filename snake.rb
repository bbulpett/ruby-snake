require 'ruby2d'

set background: 'navy'
set fps_cap: 20 # limit frames/second rate

GRID_SIZE = 20 # Each drawing is 20px
# width = 640 / 20 = 32
# height = 480 / 20 = 24

class Snake
  def initialize
    # @positions = coordinate positions [x, y] that the snake currently occupies
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down' # initial direction of snake movement
  end

  def draw
    @positions.each do |position|
      Square.new(
        x: position[0] * GRID_SIZE,
        y: position[1] * GRID_SIZE,
        size: GRID_SIZE-1 , # creates a 1px separator between snake grid blocks
        color: 'white'
      )
    end
  end

  def move
    @positions.shift # Remove first array element

    case @direction
    when 'down'
      @positions.push([head[0], head[1]+1])
    end
  end

  private

  def head
    @positions.last
  end
end

snake = Snake.new
snake.draw

update do
  clear # clear screen each time so old drawings don't overlap

  snake.move

  snake.draw
end

show
