# embed sample module


# cython: language_level=3

# C-level: exports a C entry point contained in the sample module
cdef public float c_entrypoint(float f):
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

