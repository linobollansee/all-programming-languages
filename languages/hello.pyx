# Cython example
def hello_world():
    print("Hello, World!")

cdef int add(int a, int b):
    return a + b

def py_add(int a, int b):
    return add(a, b)