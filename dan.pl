

%facts
%immediate_risk(Dan). %is pregnant, on parole, got arrested before, etc...
esl(Dan). %English as a second language
historyGrade(Dan,80).
scienceGrade(Dan,80).
mathGrade(Dan,90).
englishGrade(Dan,80).
badSchoolPast(Dan).
%goodAttendance(Dan).


%at risks rules
at_risk(X) :- immediate_risk(X).
at_risk(X) :- badSchoolPast(X), not goodBehaviorWithOther(X).
-at_risk(X) :- motivatedStudent(X).
-at_risk(X) :- isHonorRoll(X).

maybe_at_risk(X) :- not -at_risk(X), not at_risk(X).

%%define student with positive and negative emotion based on what we have
goodEmotion(X) :-  not badSchoolPast(X), academicallyGood(X).
-goodEmotion(X) :- badSchoolPast(X), not goodAttendance(X).

%%define student that have good behavior with other 
goodBehaviorWithOther(X) :- goodEmotion(X), -esl(X).
goodBehaviorWithOther(X) :- goodEmotion(X), isStem(X).
goodBehaviorWithOther(X) :- goodEmotion(X), isSocSci(X).
goodBehaviorWithOther(X) :- goodEmotion(X), goodEnglishLearner(X).
-goodBehaviorWithOther(X) :- esl(X), not goodEnglishLearner(X).
-goodBehaviorWithOther(X) :- not goodEmotion(X), badSchoolPast(X).

%%define student with good attetions.
-goodAttention(X) :- not goodAttendance(X), not goodEmotion(X), not motivatedStudent(X).

%%define motivatedStudent
motivatedStudent(X) :- goodEnglishLearner(X), academicallyGood(X).
motivatedStudent(X) :- goodBehaviorWithOther(X), goodEmotion(X).
motivatedStudent(X) :- goodAttention(X), academicallyGood(X), isStem(X).
motivatedStudent(X) :- goodAttention(X), academicallyGood(X), isSocSci(X).
-motivatedStudent(X) :- not goodAttention(X), badSchoolPast(X).

%%define what a goodEnglishLearner is
goodEnglishLearner(X) :- englishPass(X), esl(X).

%%define academicallyGood student as student pass all classes with 70
academicallyGood(X) :- not englishPass(X), sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), not sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), not historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), not mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), mathPass(X).

%%How to pass the grade
sciencePass(X) :- scienceGrade(X,A), A>=70.
mathPass(X) :- mathGrade(X,A), A>=70.
englishPass(X) :- englishGrade(X,A), A>=70.
historyPass(X) :- historyGrade(X,A), A>=70.

%%Find if the student is a special student
isStem(X) :- scienceGrade(X,A), mathGrade(X,B), A+B>=170.
isSocSci(X) :- englishPass(X), historyPass(X), englishGrade(X,A), historyGrade(X,B), A+B>=170.
isSocSci(X) :- esl(X), englishGrade(X,A), historyGrade(X,B), A+B>=150.
isHonorRoll(X) :- scienceGrade(X,A), mathGrade(X,B), englishGrade(X,C), historyGrade(X,D), (A+B+C+D)/4>=90.

?- at_risk(X).
