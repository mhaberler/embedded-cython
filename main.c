#include <Python.h>
#include <embed.h>

int main(int argc, char *argv[])
{
    // The first step is to set up the Python interpreter:
    Py_Initialize();
    PySys_SetArgv(argc, argv);
 
    // Next, we need to tell Python that our module exists. This initializes the embed extension module.
    initembed();
 
    // Now do some Python stuff.  The easiest thing to do is to give
    // the interpreter a string of Python code that imports your
    // module and calls it.
    PyRun_SimpleString("import sys\n"
		       "sys.path.append('.')\n"       // so the import succeeds
		       "import embed\n"               // still need to import the extension
		       "from test.embedlib import testfunc\n" // plain python import
		       "testfunc()\n");               // call a plain python callable

    // now call the C entry point in the extension
    float x = c_entrypoint(3.14);
    printf("c_entrypoint(3.14) returned: %f\n", x);

    // and of course we can call the Python callable in the embedded extension:
    PyRun_SimpleString("embed.python_extension(2.718)\n");

    // When we're done, tell Python to clean up.
    Py_Finalize();
    return 0;
}
