has_symptom(john, fever).
has_symptom(john, cough).
has_symptom(mary, rash).

disease(P, flu)    :- has_symptom(P, fever), has_symptom(P, cough).
disease(P, measles):- has_symptom(P, fever), has_symptom(P, rash).

