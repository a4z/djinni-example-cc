
from Data import Data 
from Storage import Storage

# TODO , make a pytest out of that

s = Storage.create()
s.add(Data(1, "eins"))
s.add(Data(2, "zwei"))

assert s.size() == 2
d1 = s.get(1)
assert d1.value == "eins"
s.remove(1)
assert s.size() == 1
assert s.get(1) == None
assert s.get(2) != None