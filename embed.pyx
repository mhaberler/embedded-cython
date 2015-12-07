# embed sample module

# cython: language_level=3

import test.embedlib


# test once if a certain call is redirected to python
entrypoint_redirect = False
try:
    if callable(test.embedlib.py_entrypoint):
        print("redirecting to test.embedlib.py_entrypoint")
        entrypoint_redirect = True
except AttributeError: # test.embedlib.py_entrypoint not defined
    pass

# C-level: exports a C entry point contained in the sample module
cdef public float c_entrypoint(float f):

    if entrypoint_redirect:
        return test.embedlib.py_entrypoint(f)

    print("not redirected,  execute default code")
    # any python here, or 'cdef-style' cython
    print("%f" % f)
    return f * f



# embedded Python level:
# exports a python callable 'embed.python_extension'
def python_extension(f):
   print("%f" % float(f))



if __name__ == "__main__":
    print("the 'embed' module is embedded.")
else:
    print("the 'embed' module is being imported.")

