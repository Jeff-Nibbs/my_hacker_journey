from urllib.parse import urljoin

import requests
from bs4 import BeautifulSoup
from urllib import *

visited_urls = set()

def spider_urls(url, keyword):
    try:
        response = requests.get(url)
    except:
        print(f"Request failed {url}")
        return
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")

        a_tags = soup.find_all("a", href=True)
        urls =[]
        for tag in a_tags:
            href = tag["href"]
            if href is not None and href != "":
                urls.append(href)
        #print(urls)
        for i in urls:
            if i not in visited_urls:
                visited_urls.add(url)
                url_join = urljoin(url, i)
                if keyword in url_join:
                    print(url_join)
                    spider_urls(url_join, keyword)
            else:
                pass


surl = input("Enter the URL you want to scrape. ")
da_keyword = input("Enter the key word to search for in the URL. ")
spider_urls(url=surl, keyword=da_keyword)

# https://google.com