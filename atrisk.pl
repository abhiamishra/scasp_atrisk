%%define what an immediate risk student is
immediate_risk(X) :- haveChild(X).
immediate_risk(X) :- onParole(X).
immediate_risk(X) :- isGovCare(X).
immediate_risk(X) :- homeless(X).
immediate_risk(X) :- abused(X).

%%define what a goodEnglishLearner is
goodEnglishLearner(X) :- englishPass(X), esl(X).

%%define what an academically good student is
academicallyGood(X) :- not englishPass(X), sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), not sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), not historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), not mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), mathPass(X).

poorSchoolPast(X) :- hadDrop(X), not advanced(X).
poorSchoolPast(X) :- not -isBullied(X), not advanced(X).
poorSchoolPast(X) :- not -isBullied(X), hadDrop(X).

motivatedStudent(X) :-
    goodAttendance(X),
    academiclyGood(X).

at_risk(X) :- immediate_risk(X), not motivatedStudent(X).
at_risk(X) :- not motivatedStudent(X), poorSchoolPast(X).
-at_risk(X) :- -immediate_risk(X).
-at_risk(X) :- academiclyGood(X),motivatedStudent(X).
-at_risk(X) :- -poorSchoolPast(X).


englishPass(Dan).
-sciencePass(Dan).
historyPass(Dan).
mathPass(Dan).
goodAttendance(Dan).

?- at_risk(X).
