# -*- coding: utf-8 -*-
"""
Created on Mon Sep 25 18:09:26 2017

@author: 54386
"""

def allVarModule (module):
    """
    
    permet de connaitre les variable et les valeur dans un module
    """
    tempData = vars(module)
    tempName = dir(module)
    for var in tempName:
        if var[0] != '_':
            print("{} : {}".format(var, tempData[var]))
    pass

if __name__ == "__main__":
    import sysVar
    allVarModule(sysVar)
    pass