import re

phoneNumRegex = re.compile(r'\d\d\d-\d\d\d-\d\d\d\d')
mo = phoneNumRegex.search('My number is 415-555-4242.')
print('Phone number found: ' + mo.group())

# geoLocation = re.compile(r'\d\d.\d\d\d\d\d\d, \d\d.\d\d\d\d\d\d')
geoLocation = re.compile(r'(\d{2}.\d{6}), (\d{2}.\d{6})')
gl = geoLocation.search('85.897011, 20.652368')
if gl:
    print('Geo Location found: ' + gl.group())
else:
    print('No Geo Location found')

