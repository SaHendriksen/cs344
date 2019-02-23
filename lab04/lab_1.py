'''
This module implements a simple classroom example of probabilistic inference
over the full joint distribution specified by AIMA, Figure 13.3.
It is based on the code from AIMA probability.py.

@author: srh34 (started by kvanderlinden)
@version: Feb. 23, 2019
'''

from probability import JointProbDist, enumerate_joint_ask


# The Joint Probability Distribution Fig. 13.3 (from AIMA Python)
P = JointProbDist(['Toothache', 'Cavity', 'Catch'])
T, F = True, False
P[T, T, T] = 0.108; P[T, T, F] = 0.012
P[F, T, T] = 0.072; P[F, T, F] = 0.008
P[T, F, T] = 0.016; P[T, F, F] = 0.064
P[F, F, T] = 0.144; P[F, F, F] = 0.576

# Compute P(Cavity|Toothache=T)  (see the text, page 493).
PC = enumerate_joint_ask('Cavity', {'Toothache': T}, P)
print(PC.show_approx())


# Exercise 4.1

# b) i)
# P(Cavity | catch) = P(Cavity and catch) / P(catch)
# P(Cavity | catch) = (.108 + .072) / (.108 + .016 + .072 + .144)
# P(Cavity | catch) = .18 / .34 = .529

# b) ii)
# Compute the P(Cavity | catch = T)
PCC = enumerate_joint_ask('Cavity', {'Catch': T}, P)
print(PCC.show_approx())

# c)
C = JointProbDist(['Coin1', 'Coin2'])
H, T = True, False
C[H, H] = .25
C[H, T] = .25
C[H, T] = .25
C[H, T] = .25

# Compute P(Coin2|coin1 = heads)
PH = enumerate_joint_ask('Coin2', {'Coin1': H}, C)
print(PH.show_approx())

