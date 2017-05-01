# 8.2 Robot in a Grid
# Imagine a robot sitting on the upper left corner of a grid with r rows and c
#   columns. The robot can only move in two directions, right and down, but
#   certain cells are "off limits" such that the robot cannot step on them.
#   Design an algorithm to find a path for the robot from the top left to the
#   bottom right.
#
# How many possible paths from 0,0 to x,y. The robot can only move in two directions, right and down.

def robot_path(grid)
  Robot.new(grid).find_unobstructed_path
end

class Robot
  def initialize(grid)
    # Calculate the width and height of the grid
    @cache = {}
    @grid = grid
    @x = @grid.first.length - 1
    @y = @grid.length - 1
    @results = []
  end

  def find_unobstructed_path
    find_path(@x, @y)
    @results.first
  end

  # Directions are now: left and up

  def find_path(x, y, path = [])
    if x.zero? && y.zero?
      @results << path
      return 1
    elsif x < 0 || y < 0
      return 0
    elsif @grid[x][y] == 1
      return 0
    end

    new_path = path.dup
    new_path.insert(0, [y, x])

    @cache[[x - 1 , y]] ||= find_path(x - 1, y, new_path)
    @cache[[x, y - 1]] ||= find_path(x, y - 1, new_path)
  end
end
