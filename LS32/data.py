import requests
password='8907'
url = "http://www.iinside.cn:7001/api_req"

data={
    'password':password,
    'reqmode':'ocr_pp'
}
files=[('image_ocr_pp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFMAAAA2CAIAAAA06TK+AAADAklEQVRoge2aPY+iQBiAHy73GwiU2xuSs1tLY0K21U5jLCyvXSot2Wps/QHGaKfthoRsuXRrYuy3hPAnuELcBUUP9DZ7ycxTwQvMzDO884FRS5IEKfnx3Q34NpS5fChz+VDm8qHM5UOZy4cylw9lLh/KXD6UuXwoc/mQ1/xn5SfmGrzSvy8XD3AapYtu46zQAfA7bDo43fRKvET0sA7lH51eRXXzatwjTn7P3z0xe/uULIPexQExIV6hR8xu1ebrzW9hhfOOGOF38NZpTGjpQdzAAWCQULum9NLm2erZ19rGeURkk/nQGsilbiXiJWKFBTHoY/whgL74zPxPKg2lY0qbt1a0DpVlMy1N5n0jXMTo6qZkqGO+EXV4qDP7jfUvijyh4ty+eymO+xMAxvjRjQ0ifke/S49rQwZTzFuLLKTiON+MAbYNnGwyB3h1rDW4bF5ofaTlxWz8GLE5XOw3jObh1KAGN3dmIZXMA7Yu1hheMScILZ1d/An2lHAMTYwGu+5hyima2IG5xvb8zDTXMKeVPapTxdyfYD2mx60VxhPPS3Tw6giDOQD2AvF0cbQHbMFy2QTUipalfgLg54NxD6dXoaklKD/OA7w1vzJtrY1wmsx62MPPoN7Fujja/Qm49IdEE+LSlesLxCvAIEGE6GCHaeRaSpv7E/TFcX7OTVjQMnJBe4FnsissJcBbYw/B4KHObFmq6taqaEkjHU1XLeZUeed1Bvnq/Q7b9nEQ0LvYbWadk1caIRroh56qjTB6FdaC3Qu4V3ueUtq8NcpvSyI2a+xp8V6ltcJa4wW5+4VJ7ObeXj9kY5aTj3geYzULrvgdRLncyXP1t5qBkxzneZZ+ktlXBzgmLE5mPgMnZGMyD44fz7HvtTZ20YwYrjHuCuJ/4+v37fs1zA7PdJOBkzDXcM7cs3/8dHcYvoORrhT2f2ce4DTQF4jC+SlDP0nzwjva7QdEbexpvkcMHlxmH98I7qXUO4+m/hUmHcpcPpS5fChz+VDm8qHM5UOZy4e85n8AeLv48v5DkNEAAAAASUVORK5CYII=','application/octet-stream')]
headers = {}
response = requests.post( url, headers=headers, data=data, files=files)
print(response.text)