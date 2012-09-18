import string
from random import choice

size = 14 
print ''.join([choice(string.letters + string.digits) for i in range(size)])
# reseach this http://stackoverflow.com/questions/5480131/will-python-systemrandom-os-urandom-always-have-enough-entropy-for-good-crypto
