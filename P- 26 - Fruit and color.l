% facts
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(pear, green).

% query helper (backtracking will enumerate all)
color_of(Fruit, Color) :- fruit_color(Fruit, Color).
