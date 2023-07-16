countries = %w[РФ Китай Франция Великобритания Норвегия Камбоджа]

capitals = %w[Москва Пекин Париж Лондон Осло Пномпень]

result = countries.zip capitals
puts result.to_h.inspect