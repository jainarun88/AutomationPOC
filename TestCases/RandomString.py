import random
import string
from string import ascii_lowercase
from datetime import datetime
import calendar

# 00000011-8eb2-4249-aa78-433340000254
tenentID = "00000011"

spec = [
    range(1, 9), *[ascii_lowercase] * 2, range(1, 9), "-",
    range(1, 9999), "-",
    *[ascii_lowercase] * 2, range(1, 99), "-",
    range(1, 999999999999),
]
output = tenentID + "-" + ''.join(str(random.choice(pool)) for pool in spec)
print(output)

######################################################################################
# 00000011-0000-4000-8000-333440000254
letters1 = string.digits
output1 = tenentID + "-" + ''.join(random.choice(letters1) for i in range(4)) + "-" + \
          ''.join(random.choice(letters1) for i in range(4)) + "-" + \
          ''.join(random.choice(letters1) for i in range(4)) + "-" + \
          ''.join(random.choice(letters1) for i in range(12))

print(output1)
##############################################################################################
# Auto-m2a-activate-1044
letters2 = string.digits
output2 = "Auto-m2a-activate-" + ''.join(random.choice(letters2) for i in range(5))
print(output2)
##############################################################################################
# 2022-05-23T09:37:40.508Z
now = datetime.utcnow().isoformat() + "Z"
print('Current DateTime:', now)
