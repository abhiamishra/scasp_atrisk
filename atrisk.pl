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

%%How to pass the grade
sciencePass(X) :- scienceGrade(X,A), A>=70.
mathPass(X) :- mathGrade(X,A), A>=70.
englishPass(X) :- englishGrade(X,A), A>=70.
historyPass(X) :- historyGrade(X,A), A>=70.

%%Find if the student is a STEM student
isStem(X) :- sciencePass(X), mathPass(X), scienceGrade(X,A), mathGrade(X,B), A+B>=170.
isSocSci(X) :- englishPass(X), historyPass(X), englishGrade(X,A), historyGrade(X,B), A+B>=170.
isSocSci(X) :- esl(X), englishGrade(X,A), historyGrade(X,B), A+B>=150.
isHonorRoll(X) :- scienceGrade(X,A), mathGrade(X,B), englishGrade(X,C), historyGrade(X,D), (A+B+C+D)/4>=90.

%%Teacher-observed behavior
findBehavior(X, [X|_]).
findBehavior(X, [_|T]) :- findBehavior(X, T).
immediate_risk(X) :- behavior(X), findBehavior(X,['violent','depressed','lonely','repressed','abused','harassed']).
goodBehaviorWithOther(X) :- behavior(X), not findBehavior(X, ['distant', 'frustrated', 'agitated', 'alone', 'fearful', 'noncooperation', 'impulsive']).


motivatedStudent(X) :-
    goodAttendance(X),
    academiclyGood(X).

motivatedStudent(X) :- academicallyGood(X), goodBehaviorWithOther(X).


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
