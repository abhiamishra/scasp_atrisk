immediate_risk(X) :- haveChild(X) , onParole(X) , isGovCare(X) , homeless(X) , abused(X).

goodEnglishLearner(X) :-
    englishPass(X),
    esl(X).

academiclyGood(X) :-
    englishPass(X), 
    sciencePass(X), 
    historyPass(X), 
    mathPass(X).

academiclyGood(X) :-
    englishPass(X), 
    sciencePass(X), 
    historyPass(X), 
    mathPass(X).

poorSchoolPast(X) :-
    not -isBullied(X),
    not -hadDrop(X),
    not advanced(X).

motivatedStudent(X) :-
    goodAttendance(X),
    academiclyGood(X).

at_risk(X) :- immediate_risk(X), not motivatedStudent(X).
at_risk(X) :- not motivatedStudent(X), poorSchoolPast(X).
-at_risk(X) :- -immediate_risk(X).
-at_risk(X) :- academiclyGood(X),motivatedStudent(X).
-at_risk(X) :- -poorSchoolPast(X).


englishPass(Dan).
sciencePass(Dan).
historyPass(Dan).
mathPass(Dan).

goodAttendance(Dan).

?- at_risk(X).
