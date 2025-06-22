#! /usr/bin/env python3
from selenium import webdriver
import time
from selenium.webdriver.common.by import By

FILE_TYPE = [".py", ".html", ".js", ".json"]
visited_urls = set()
target_url = input("URL: ")


if target_url != "" and target_url is not None:
    repo_urls = []
    driver = webdriver.Chrome()
    driver.get(url=target_url)
    time.sleep(2)
    repo_texts = driver.find_elements(By.CLASS_NAME, "repo")

    for name in repo_texts:
        repo_urls.append(f"{target_url}/{name.text}")

    if repo_urls != "" and repo_urls is not None:
        for next_repo in repo_urls:
            driver.get(url=next_repo)
            time.sleep(2)
            repo_link_texts = driver.find_elements(By.CLASS_NAME, "Link--primary")
            for link in repo_link_texts:
                if link != "" and link is not None:
                    print(link.text)
                    for filetype in FILE_TYPE:
                        if filetype in link.text:
                            file_page_url = f"{next_repo}/blob/main/{link.text}"
                            print(file_page_url)


    # https://github.com/Jeff-Nibbs