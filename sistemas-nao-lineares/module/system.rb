# Módulo System
module System
  # Função f1(x, y)
  def self.f1_x_y(coord_x, coord_y)
    coord_x * coord_x + coord_y * coord_y - 4
  end

  # Função f2(x, y)
  def self.f2_x_y(coord_x, coord_y)
    coord_y - coord_x * coord_x - 1
  end

  def self.partial_x_f1(coord_x, _coord_y)
    2 * coord_x
  end

  def self.partial_y_f1(_coord_x, coord_y)
    2 * coord_y
  end

  def self.partial_x_f2(coord_x, _coord_y)
    -2 * coord_x
  end

  def self.partial_y_f2(_coord_x, _coord_y)
    1
  end

  def self.j_f1_f2(coord_x, coord_y)
    partial_x_f1(coord_x, coord_y) * partial_y_f2(coord_x, coord_y) - partial_y_f1(coord_x, coord_y) * partial_x_f2(coord_x, coord_x)
  end

  def self.delta_x(coord_x, coord_y)
    d_x = -f1_x_y(coord_x, coord_y) * partial_y_f2(coord_x, coord_y) + f2_x_y(coord_x, coord_y) * partial_y_f1(coord_x, coord_y)
    d_x.to_f / j_f1_f2(coord_x, coord_y)
  end

  def self.delta_y(coord_x, coord_y)
    d_y = -f2_x_y(coord_x, coord_y) * partial_x_f1(coord_x, coord_y) + f1_x_y(coord_x, coord_y) * partial_x_f2(coord_x, coord_y)
    d_y.to_f / j_f1_f2(coord_x, coord_y)
  end
end
