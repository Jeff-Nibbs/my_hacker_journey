#! /usr/bin/env python3
from selenium import webdriver
import time
from selenium.webdriver.common.by import By

FILE_TYPE = [".py", ".html", ".js", ".json", ".sh"]
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
        repo_link_texts = []
        for next_repo in repo_urls:
            driver.get(url=next_repo)
            time.sleep(2)
            repo_link_text = driver.find_elements(By.CLASS_NAME, "Link--primary")
            for j in repo_link_text:
                repo_link_texts.append(j.text)
            for link in repo_link_texts:
                if link != "" and link is not None:
                    for filetype in FILE_TYPE:
                        if filetype in link:
                            file_page_url = f"{next_repo}/blob/main/{link}"
                            driver.get(url=file_page_url)
                            time.sleep(2)
                            raw_data_button = driver.find_element(By.CLASS_NAME, value="lefpaC")
                            raw_data_button.click()
                            time.sleep(2)
                            html = driver.page_source
                            html = f"{html}"
                            if "password" in html:
                                print(f"We did it we got one! {file_page_url}")
    driver.quit()


    # https://github.com/usernam121