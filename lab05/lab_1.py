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
burglary = BayesNet([
    ('Burglary', '', 0.001),
    ('Earthquake', '', 0.002),
    ('Alarm', 'Burglary Earthquake', {(T, T): 0.95, (T, F): 0.94, (F, T): 0.29, (F, F): 0.001}),
    ('JohnCalls', 'Alarm', {T: 0.90, F: 0.05}),
    ('MaryCalls', 'Alarm', {T: 0.70, F: 0.01})
    ])

# Compute P(Burglary | John and Mary both call).
print(enumeration_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# elimination_ask() is a dynamic programming version of enumeration_ask().
print(elimination_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# gibbs_ask() is an approximation algorithm helps Bayesian Networks scale up.
print(gibbs_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# See the explanation of the algorithms in AIMA Section 14.4.

# Exercise 5.1
# i)
print(enumeration_ask('Alarm', dict(Burglary=T, Earthquake=F), burglary).show_approx())
# Output - False: .06, True: .94
# Explanation -
# The probability of their being an alarm given there is a burglary and not an earthquake is high which means that
# having an earthquake set of the alarm is outweighed by a burglary setting of the alarm. This one you read right off
# the chart.

# ii)
print(enumeration_ask('JohnCalls', dict(Burglary=T, Earthquake=F), burglary).show_approx())
# Output - False: .151, True: .849
# Explanation -
# Because John calling is heavily impacted by if the alarm goes of and the burglary is the bigger factor in setting off
# the alarm, it makes sense that even if there isn't an earthquake, John would call if the alarm went off.

# iii)
print(enumeration_ask("Burglary", dict(Alarm=T), burglary).show_approx())
# Output - False: .626, True: .374
# Explanation -
# It makes sense that the probability of there actually being a burglary if the alarm is going off is small
# considering the chances of a burglary are very small. This one we did in class and they match what we did then.

# iv)
print(enumeration_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
# Output - False: .716, True: .284
# Explanation -
# Again, it makes sense that the probability of there actually being a burglary if John and Mary both call is still
# small considering the probability of a burglary actually happening is very small
