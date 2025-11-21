diet(diabetes, 'Avoid sugar, rice; eat wheat, vegetables.').
diet(fever, 'Drink fluids and eat fruits.').
diet(bp, 'Low salt diet.').

suggest(D, Food) :- diet(D, Food).
