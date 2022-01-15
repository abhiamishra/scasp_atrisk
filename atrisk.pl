
%% GRADES AND ACADEMICS %%

%%How to pass the grade
sciencePass(X) :- scienceGrade(X,A), A>=70.
mathPass(X) :- mathGrade(X,A), A>=70.
englishPass(X) :- englishGrade(X,A), A>=70.
historyPass(X) :- historyGrade(X,A), A>=70.

%%define academicallyGood student as student pass all classes with 70
academicallyGood(X) :- not englishPass(X), sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), not sciencePass(X), historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), not historyPass(X), mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), not mathPass(X).
academicallyGood(X) :- englishPass(X), sciencePass(X), historyPass(X), mathPass(X).

%%Find if the student is a special student (category)
isStem(X) :- scienceGrade(X,A), mathGrade(X,B), A+B>=170.
isSocSci(X) :- englishPass(X), historyPass(X), englishGrade(X,A), historyGrade(X,B), A+B>=170.
isSocSci(X) :- esl(X), englishGrade(X,A), historyGrade(X,B), A+B>=150.
isHonorRoll(X) :- scienceGrade(X,A), mathGrade(X,B), englishGrade(X,C), historyGrade(X,D), (A+B+C+D)/4>=90.

%%define what a goodEnglishLearner is
goodEnglishLearner(X) :- englishPass(X), esl(X).

%% GRADES AND ACADEMICS %%

%% BEHAVIORS %%

%%define student with positive and negative emotion based on what we have
goodEmotion(X) :-  not badSchoolPast(X), academicallyGood(X).
goodEmotion(X) :- not badSchoolPast(X), goodAttendance(X).

%%define student that have good behavior with other 
goodBehaviorWithOther(X) :- goodEmotion(X), -esl(X).
goodBehaviorWithOther(X) :- goodEmotion(X), isStem(X).
goodBehaviorWithOther(X) :- goodEmotion(X), isSocSci(X).
goodBehaviorWithOther(X) :- goodEmotion(X), goodEnglishLearner(X).
-goodBehaviorWithOther(X) :- esl(X), not goodEnglishLearner(X).
goodBehaviorWithOther(X) :- goodEmotion(X), badSchoolPast(X).

motivatedStudent(X) :- goodEnglishLearner(X), academicallyGood(X).
motivatedStudent(X) :- goodBehaviorWithOther(X), goodEmotion(X), not -academicallyGood(X).
motivatedStudent(X) :- goodAttendance(X), academicallyGood(X), isStem(X).
motivatedStudent(X) :- goodAttendance(X), academicallyGood(X), isSocSci(X).
-motivatedStudent(X) :- not goodAttendance(X), badSchoolPast(X).

%% BEHAVIORS %%

%% AT RISK CALCULATION %%

at_risk(X) :- immediate_risk(X).
at_risk(X) :- badSchoolPast(X), not goodBehaviorWithOther(X).

-at_risk(X) :- motivatedStudent(X).
-at_risk(X) :- isHonorRoll(X).
-at_risk(X) :- goodBehaviorWithOther(X), goodAttendance(X).

historyGrade(dan,90).
scienceGrade(dan,90).
mathGrade(dan,90).
englishGrade(dan,90).
esl(dan).
goodAttendance(dan).
badSchoolPast(dan).

?- at_risk(X).
