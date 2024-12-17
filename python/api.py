# API OOP
import requests
from time import sleep

country = 'ca' # Canada.
year = '2022'
api_url = 'https://api.api-ninjas.com/v1/holidays?country={}&year={}'.format(country, year)
response = requests.get(api_url, headers={'X-Api-Key': 'Ag6AKyCVtb2KQDjxVabpBg==J0kBcd2PyWyJAmZp'})

characters = []

if response.status_code == 200:
    try:
        holidays = response.json()
    except json.JSONDecodeError as e:
        print("Error:", response.status_code)
        exit()

    for holiday in holidays:
        country = holiday.get('country')
        date = holiday.get('date')
        day = holiday.get('day')
        name = holiday.get('name')
        result = [country, date, day, name]
        characters.append(result)
        sleep(2)
        print(result)

else:
    print("Error:", response.status_code)

## write file
import csv

header = ["country", "date", "day", "name"]
with open("holidays.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(characters)

!cat holidays.csv

