#! /usr/bin/env python3
from selenium import webdriver
import time
from selenium.webdriver.common.by import By

# https://github.com/usernam121
# https://github.com/Jeff-Nibbs

visited_urls = set()

def get_url():
    entered_url = input("URL: ")
    return entered_url

def get_link(repo_url, class_value):
    driver.get(repo_url)
    time.sleep(2)
    res = driver.find_elements(By.CLASS_NAME, value=class_value)
    return res

def read_soup(da_res):
    repo_names = []
    for i in da_res:
        repo_names.append(i.text)
    return repo_names

def link_maker(first_url, name_list):
    repo_urls = []
    for l in name_list:
        full_url = f"{first_url}/{l}"
        if full_url not in visited_urls:
            visited_urls.add(full_url)
            repo_urls.append(full_url)
    return repo_urls

url = get_url()
if url != "" and url is not None:
    driver = webdriver.Chrome()
    first_page = read_soup(get_link(repo_url=url,class_value="repo"))
    first_page_links = link_maker(first_url=url, name_list=first_page)


    for link in first_page_links:
        driver.get(link)
        time.sleep(2)
        res = driver.find_elements(By.CLASS_NAME, value="Link--primary")




    driver.quit()