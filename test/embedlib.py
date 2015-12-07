

def testfunc():
    print "hi from embedlib.testfunc"



# if this function is renamed or deleted, entrypoint_redirect in embed.pyx will remain False
def py_entrypoint(x):
    return x * x * x *x 

if __name__ == "__main__":
    print("the 'embedlib' module is embedded.")
else:
    print("the 'embedlib' module is being imported.")

