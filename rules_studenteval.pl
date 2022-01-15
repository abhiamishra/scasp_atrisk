%%facts
at_risk(dan).
maybe_at_risk(dan).

effort(no).
bad_mental_health(yes).
is_alienated(yes).
procrastinates(yes).
unhappy_with_major(yes).
academic_preparedness(yes).
involved(no).
grades_declining(yes).
decreased_involvement(yes).
missed_assignments(yes).
skip_class(yes).


%%rules
alienated_student(X, Y):- at_risk(Y), is_alienated(X), not involved(X).
alienated_student(X, Y):- maybe_at_risk(Y), is_alienated(X), not involved(X).
alienated_response(X, Y):- alienated_student(X, Y), write('Try to communicate with people on a deeper level to develop friendships and a sense of belonging/community within your campus.').

overwhelmed_student(X, Y):- at_risk(Y), bad_mental_health(X), procrastinates(X), not effort(X), missed_assignments(X), skip_class(X), decreased_involvement(X).
overwhelmed_student(X, Y):- at_risk(Y), bad_mental_health(X), procrastinates(X), effort(X), missed_assignments(X), skip_class(X), decreased_involvement(X).
overwhelmed_student(X, Y):- at_risk(Y), bad_mental_health(X), not procrastinates(X), not effort(X), missed_assignments(X), skip_class(X), decreased_involvement(X).
overwhelmed_student(X, Y):- at_risk(Y), bad_mental_health(X), not procrastinates(X), effort(X), missed_assignments(X), skip_class(X), decreased_involvement(X).
overwhelmed_response(X, Y):- overwhelmed_student(X, Y), write('It is most likely that your overwhelmed feelings come from being constantly bombarded. Try to find the source of this. Are you taking an unnecessarily high amount of credit hours? Is your time management poor? Are you procrastinating? Try to start your assignments as soon as you can. If you need academic help with them, go to your professors office hours whenever possible.').

unprepared_student(X, Y):- at_risk(Y), not bad_mental_health(X), effort(X), not procrastinates(X), not academic_preparedness(X), grades_declining(X).
unprepared_student(X, Y):- at_risk(Y), not bad_mental_health(X), not effort(X), not procrastinates(X), not academic_preparedness(X), grades_declining(X).
unprepared_response(X, Y):- unprepared_student(X, Y), write('Try making a plan for academic success. What steps can you take to put yourself on track academically? If you need help making plans, make an attempt to talk with an academic advisor. You can also utilize resources both externally and internally. Youtube is a great way to learn if struggling, and so are office hours/tutoring if one-on-one help is needed.').

unhappy_student_major(X, Y):- unhappy_with_major(X), -effort(X), not academic_preparedness(X), grades_declining(X), at_risk(Y).
unhappy_student_major(X, Y):- unhappy_with_major(X), -effort(X), not academic_preparedness(X), grades_declining(X), maybe_at_risk(Y).
unhappy_response(X, Y):- unhappy_student_major(X, Y), write ('Try looking into other majors so that you fully understand if dropping out is the correct decision for you. Pursuing a subject you are truly passionate about will increase your productivity, thus leading to an increase in effort, grades, and much more.'). 

depressed_student(X, Y):- not effort(X), bad_mental_health(X), is_alienated(X), 
procrastinates(X), not -involved(X), grades_declining(X), at_risk(Y).
depressed_student(X, Y):- not effort(X), bad_mental_health(X), is_alienated(X), procrastinates(X), not -involved(X), grades_declining(X), maybe_at_risk(Y).
depressed_response(X, Y):- depressed_student(X, Y), write ('Please use campus resources to address any mental health problems: https://counseling.utdallas.edu/depression/. If you are feeling depressed, get in contact with a trusted adult and explain how you feel.'). 
