from bs4 import BeautifulSoup
from tqdm import tqdm
import requests

if __name__ == '__main__':
    for i in tqdm(range(1000)):
        target = 'https://fun.886.be/api.php?level=max'
        req = requests.get(url = target, timeout = 1)
        file = open("./list.txt", "a", encoding = 'utf-8')
        file.write("'" + req.text + "'," + "\n")
        file.close()