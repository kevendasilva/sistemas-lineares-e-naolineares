require_relative '../module/system'
# Classe Main
class Main
  include System

  x1 = -1
  y1 = 1.732
  x2 = x1 + System.delta_x(x1, y1)
  puts x2
end
