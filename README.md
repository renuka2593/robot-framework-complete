## RobotFramework [![Run Robot Framework Tests](https://github.com/renuka2593/robot-framework-complete/actions/workflows/robot_tests.yml/badge.svg)](https://github.com/renuka2593/robot-framework-complete/actions/workflows/robot_tests.yml)

This project is a comprehensive automation suite built using Robot Framework, designed to facilitate end-to-end testing
across multiple domains: UI, API, and Database. The suite provides a unified structure to automate user interactions,
validate APIs, and verify data integrity, enabling a full spectrum of testing for web applications and backend services.

### **Key Features**

* **UI Testing**: Powered by the Browser library is a browser automation library for Robot Framework. Browser library uses Playwright Node module to automate Chromium, Firefox and WebKit with a single library.
* **API Testing**: Using the RequestsLibrary for HTTP requests, the framework supports RESTful API testing. It allows
  for HTTP methods (GET, POST, PUT, DELETE), parameterization, response validation, and assertion of JSON data. This
  enables thorough validation of API endpoints and supports data-driven tests.
* **Database Testing**: Integrated with the DatabaseLibrary, this suite performs database operations and validations. It
  supports querying SQL databases, validating data integrity, and cross-checking data consistency between UI, API, and
  database layers, enhancing the accuracy of test coverage.

### Prerequisites

Before running this project, ensure you have the following installed:

* Python3
* pip (included with Python 3+)

### Installation

Use pip to install the required libraries:

```bash
pip install -r requirements.txt
```

```bash
python -m Browser.entry init
```

```commandline
rfbrowser --version
```

### Run automation scripts

```bash
robot tests_package/filname.robot
```
