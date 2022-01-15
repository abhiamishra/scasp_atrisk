

%facts
immediate_risk(Dan). %is pregnant, on parole, got arrested before, etc...
esl(Dan). %English as a second language
englishPass(Dan,80).
sciencePass(Dan,80).
mathPass(Dan,80).
historyPass(Dan,80).
badSchoolPast(Dan).
goodAttendance(Dan).


%rules
at_risk(X) :- immediate_risk(X).

goodEmotion(X) :- -badSchoolPast(X), academiclyGood(X).
-goodEmotion(X) :- badSchoolPast(X), not goodAttendance(X).

goodBehaviorWithOther(X) :- goodEmotion(X), -esl(X).
goodBehaviorWithOther(X) :- goodEmotion(X), goodEnglishLearner(X).
-goodBehaviorWithOther(X) :- esl(X), not goodEnglishLearner(X).
-goodBehaviorWithOther(X) :- not goodEmotion(X).

-goodAttention(X) :- not goodAttendance(X), not goodEmotion(X), not motivatedStudent(X).

motivatedStudent(X) :- goodAttention(X), academiclyGood(X).
-motivatedStudent(X) :- not goodAttention(X).


?- at_risk(X).
