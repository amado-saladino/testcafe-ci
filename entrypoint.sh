#! /bin/bash

testcafe
allure generate allure/allure-results --clean -o allure/allure-report
allure open allure/allure-report --port 8000