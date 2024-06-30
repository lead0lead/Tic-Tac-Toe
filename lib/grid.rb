# frozen_string_literal: true

require_relative 'cell'

# The board of the game, made from cells
class GRID
  attr_reader :grid_column_amount
  attr_reader :grid_row_amount

  def initialize(grid_column_amount, grid_row_amount)
    @grid_column_amount = grid_column_amount
    @grid_row_amount = grid_row_amount
  end

  def create_grid(grid_column_amount, grid_row_amount)
    grid = []
    grid_column_amount.times do |i|
      grid_row_amount.times do |j|
        cell = CELL.new(i,j,"empty")
        grid.push(cell)
      end
    end
    p grid
  end
end
