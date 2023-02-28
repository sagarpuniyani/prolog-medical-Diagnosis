% A Medical diagnosis program in Prolog.  Sagar Puniyani , dec 11, 2022.
% Predicates that define the hypothesis Satisfaction:

diagnosis:-hypothesis(Diseases),
    write('The diseases of the patient is ,'),
    write(Diseases),
    nl,
    treatment(Diseases),
    undo.

hypothesis(flu):- flu,!.
hypothesis(malaria):- malaria,!.
hypothesis(diabetes):- diabetes,!.
hypothesis(asthma):- asthma,!.
hypothesis(alzhemer):- alzhemer,!.
hypothesis(obesity):- obesity,!.
hypothesis(arthritis):- arthritis,!.
hypothesis(tuberculosis):- tuberculosis,!.
hypothesis(mumps):- mumps,!.
hypothesis(chickenpox):- chickenpox,!.
hypothesis(malnutrition):- malnutrition,!.
hypothesis(clod):- cold,!.
hypothesis(hypertention):- hypertention,!.
hypothesis(unknown).


flu:-
    verify(fever),
    verify(cough),
    verify(sore_throat),
    verify(runny_nose),
    verify(fatigue).

treatment(flu):-
    write('1.Stay at home and rest.'),nl,
    write('2.Avoid close contact with well people.'),nl,
    write('3.Drink plenty of water.').


malaria:-
    verify(fever),
    verify(headache),
    verify(muscleache),
    verify(vomitting),
    verify(shaking_chills).

treatment(malaria):-
    write('1.Take complete bed rest.'),nl,
    write('2.Take antimalarial medication'),nl,
    write('3.Contant to specialist').

diabetes:-
    verify(dry_skin),
    verify(increased_body_weight),
    verify(frequent_urination),
    verify(fatigue),
    verify(blurry_vision).

treatment(diabetes):-
    write('1.Take insulin or other meditation.'),nl,
    write('2.Dietary Changes.'),nl,
    write('3.Do exercise regularly.').

asthma:-
    verify(shortness_of_breath),
    verify(cough),
    verify(wheezing).

treatment(asthma):-
    write('1.Inhaled corticosteroids.'),nl,
    write('2.Broncholilators.'),nl,
    write('3.Allergy treatment.').

alzhemer:-
    verify(memory_loss),
    verify(difficulty_communicating),
    verify(disorientation),
    verify(changes_behavior).

treatment(alzhemer):-
    write('1.daliy meditation.'),nl,
    write('2.cognitive behavioral therapy.'),nl,
    write('3.supportive care.').


obesity:-
    verify(increased_body_weight),
    verify(difficulty_losing_weight).

treatment(obesity):-
    write('1.Dietary changes and exercise.'),nl,
    write('2.Daily meditation.'),nl,
    write('3.Surgery in severe cases.').

arthritis:-
    verify(joint_pain),
    verify(stiffness),
    verify(difficulty_moving_joints),
    verify(dizziness).

treatment(arthritis):-
    write('1.Daily meditation and exercise.'),nl,
    write('2.Physical therapy.'),nl,
    write('3.Take advice for surgery.').

tuberculosis:-
    verify(fever),
    verify(cough),
    verify(night_sweats),
    verify(weiht_loss).

treatment(tuberculosis):-
    write('1.Take concern with doctor.'),nl,
    write('2.Antibiotic Therapy.'),nl,
    write('3.hospitalization in serious case.').

mumps:-
    verify(dizziness),
    verify(fever),
    verify(swelling_salivary_gland),
    verify(muscle_ache).

treatment(mumps):-
    write('1. patient needs supportive care.'),nl,
    write('2. Vaccination to prevent future infection.'),nl,
    write('3. Hospitalization in case of serious case.').

chickenpox:-
    verify(rash),
    verify(fever),
    verify(loss_appetite),
    verify(headache).

treatment(chickpox):-
    write('1.Meditation for reduce fever.'),nl,
    write('2.Vaccination to prevent future infection.'),nl,
    write('3.Concern with specialist.').



malnutrition:-
    verify(weakness),
    verify(fatigue),
    verify(loss_appetite),
    verify(weight_loss).

treatment(malnutrition):-
    write('1.Needs dietary changes.'),nl,
    write('2.Take supplements.'),nl,
    write('3.Change life style.').


cold:-
    verify(cough),
    verify(sneezing),
    verify(runny_nose),
    verify(sore_throat).

treatment(cold):-
    write('1. Take proper rest.'),nl,
    write('2. Go for check-up.'),nl,
    write('3. Take proper hydration.').


hypertention:-
    verify(headaches),
    verify(nosebleed),
    verify(irregular_heart_rhytms),
    verify(vision_changes),
    verify(buzzing).

treatment(hypertention):-
    write('1. Maintain healty lifestyle.'),nl,
    write('2. Don''t take strees.'),nl,
    write('3. Daily meditation and exercise.').


ask(Question):-
    write('Does the patient has '),
    write(Question),
    write('?'),
    read(Response),
    nl,
    (   (Response == yes ; Response == y )
    ->
    asserta(yes(Question));
    asserta(no(Question)), fail).



% This the dynamic code avoiding the inconsistences 
% that will help in one parameter enter one at a _time.
:-dynamic (yes/1,no/1).

% to verify something

verify(S):-
    (yes(S)
    ->
    true;
    (no(S)
    ->
    fail;
    ask(S))).

undo:-retract(yes(_)),fail.
undo:-retract(no(_)),fail.
undo.
