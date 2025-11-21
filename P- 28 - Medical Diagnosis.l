% symptoms facts
has_fever(john).
has_cough(john).
has_rash(mary).
has_headache(john).

% rules
disease(X, flu)    :- has_fever(X), has_cough(X).
disease(X, measles):- has_fever(X), has_rash(X).
disease(X, migraine):- has_headache(X), \+ has_fever(X).

% query helper
diagnose(Patient, D) :- disease(Patient, D).
