# frozen_string_literal: true

# Class for individual Cells of the "board"/grid. Stores its marking (Is it empty, and x, or an o?)
class CELL
  attr_accessor :marking

  def initialize(row_coordinate, column_coordinate, marking)
    @row_coordinate = row_coordinate
    @column_coordinate = column_coordinate
    @marking = marking
  end
end
