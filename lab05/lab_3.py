'''
This module implements the Bayesian network shown in the text, Figure 14.2.
It's taken from the AIMA Python code.

@author: Sarah Hendriksen (srh34)
@startedby: kvlinden
@version Jan 2, 2013
'''

from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# From AIMA code (probability.py) - Fig. 14.2 - burglary example
happiness = BayesNet([
    ('Sunny', '', 0.70),
    ('Raise', '', 0.01),
    ('Happy', 'Sunny Raise', {(T, T): 1.0, (T, F): 0.70, (F, T): 0.90, (F, F): 0.10}),
    ])

# Exercise 5.3
# a)
# i)
print(enumeration_ask('Raise', dict(Sunny=T), happiness).show_approx())
# Output - False: .99, True: .01
# Hand-computed -
#   P(R | s) = < .01, .99 > --> they are independent events so it is just P(R)

# ii)
print(enumeration_ask('Raise', dict(Sunny=T, Happy=T), happiness).show_approx())
# Output - False: .986, .0142
# Hand-computed -
#   P(R | h and s) = alpha P(R, h, s)
#                  = alpha P(h | R and s) * P(s) * p(R)
#                  = alpha < P(h | R and s) * P(s) * p(R), P(h | not R and s) * P(s) * p(not R) >
#                  = alpha < 1.0 * .7 * .01, .7 * .7 * .99 >
#                  = alpha < .007, .4851 >
#                  = < .0142, .986 >

# Explanation -
# These probabilities make sense because sunny and getting a raise are independent events so it makes sense that when
# you factor in being happy and it being sunny that the probability increases significantly for if you got a raise.

# b)
# i)
print(enumeration_ask('Raise', dict(Happy=T), happiness).show_approx())
# Output - False: 0.982, True: 0.0185

# ii)
print(enumeration_ask('Raise', dict(Happy=T, Sunny=F), happiness).show_approx())
# Output - False: 0.917, True: 0.0833

# These answers makes sense because they reinforce the fact that given it is sunny doesn't change your chance of
# getting a raise by much. Happiness is a more predictive of if you got a raise or not