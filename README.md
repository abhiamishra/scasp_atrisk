Devpost link: https://devpost.com/software/rise-risk-identifier-student-evaluation
# Inspiration
Each year, around one million students drop out of college. This statistic is only increasing in both college and secondary school, and it is caused by factors such as drugs, mental health issues, high stress, physical health issues, and socio-economic issues just to name a few. RISE was developed to help students and parents determine if a student is at risk of dropping out of school, and provides advice to prevent this from happening

# What it does
Our system analyzes if a student is at risk of dropping out of school. To calculate whether a student is at risk, factors taken into account are how the student is performing academically and socially at the present. Once the risk level of a student is determined, our program uses a student’s academic and social history to determine which reason a student might be on the verge of failing/dropping out, and a recommendation is given based on said reason.

# How we built it
Our system was built through understanding that first, we must determine whether or not a student is at risk of failing out of school or dropping out. To do this, we brainstormed facts that are associated with how students could be categorized into either being at risk, maybe at risk, or not at risk. Using a students current academic record and their behavior, we were able to build a model that effectively decides which category a student fits into. After this, we needed to build a model that, when a student is place in at risk or maybe at risk, analyzed why this student is placed in the category. Through a model that utilizes a both a student’s current and past social and academic history, we were determine the reason for why a student is at risk.

# Challenges we ran into
Finding good resources on identifying at-risk students, we only found straight-up at-risk, but no not-at-risk identification, so we have to make our own
There is no good available concrete and solid advice on the internet if the student is at-risk.
One fact stall infinitely a completely unrelated rule that does not use that fact. When the fact in question is deleted, the rule does not stall.
Debugging.

# Accomplishments that we're proud of
Connect multiple facts together to create one single complex rule.
Able to debug and actually see the code work.
What we learned
Prolog, a new language acquired.
think about how our thought processes and mind work and lay it out on paper.

# What's next for RISE (Risk Identifier Student Evaluation)
Because this project is made up mainly of CS/CE students, we do not have the necessary info on how to better identify at-risk students. We would want some feedback and input from public education counselors and advisors in order to help identify at-risk students early on and properly allocate resources to help these students.
