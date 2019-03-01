'''
This module implements the Bayesian network shown in the text for chances of having cancer

@author: Sarah Hendriksen (srh34)
@startedby: kvlinden
@version Jan 2, 2013
'''

from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# From AIMA code (probability.py) - Fig. 14.2 - burglary example
cancer = BayesNet([
    ('Cancer', '', 0.01),
    ('Test1', 'Cancer', {T: 0.90, F: 0.20}),
    ('Test2', 'Cancer', {T: 0.90, F: 0.20})
    ])

# Exercise 5.2
# a)
print(enumeration_ask('Cancer', dict(Test1=T, Test2=T), cancer).show_approx())
# Output - False: 0.83, True: 0.17
# Hand-coding -
# P(C | t1 = T, t2 = T) = alpha P(C, t1 = T, t2 = T)
#                       = alpha < P(C) * P(t1 = T | C) * P(t2 = T | C),
#                                   P(not C) * P(t1 = T | not C) * P(t2 = T | not C)>
#                       = alpha < .01 * .9 * .9, .99 * .2 * .2 >
#                       = alpha < .0081, .0396 >
#                       = < .170, .830 >

# b)
print(enumeration_ask('Cancer', dict(Test1=T, Test2=F), cancer).show_approx())
# Output - False: .994, True: .00565
# Hand-coding -
# P(C | t1 = T, t2 = F) = alpha P(C, t1 = T, t2 = F)
#                       = alpha < P(C) * P(t1 = T | C) * P(t2 = F | C),
#                                   P(not C) * P(t1 = T | not C) * P(t2 = F | not C)>
#                       = alpha < .01 * .9 * .1, .99 * .2 * .8 >
#                       = alpha < .0009, .1584 >
#                       = < .00565, .994 >


# Explanation -
# The results do make sense considering the probability of having cancer in the first place is so low. The effect of one
# one failed cancer test does decrease your likelihood to almost none.