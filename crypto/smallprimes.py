'''
Small Primes
(n) Seth Temple (e) sdtemple at uw dot edu
'''

from math import gcd

def is_prime(p):
    '''
    Check if an integer is prime
    :param p: int
    :rtype: bool
    '''
    ctr = 0
    for i in range(1,p):
        if gcd(i, p) == 1:
            ctr += 1

    if ctr == (p - 1):
        return True
    else:
        return False
        

def iprime(i):
    '''
    :param i: int
    :return: the ith prime
    :rtype: int
    '''


def iprimelist(i):
    '''
    :param i: int
    :return: the first i primes
    :rtype: list
    '''
            

def lprime(l):
    '''
    :param l: int
    :return: closest prime <= l
    :return: int
    '''


def lprimelist(l):
    '''
    :param l: int
    :return: primes <= l
    :rtype: list
    '''



def rprime(l):
    '''
    :param l: int
    :return: random prime <= l
    :rtype: int
    '''
    
