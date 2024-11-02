## RobotFramework

This project is a comprehensive automation suite built using Robot Framework, designed to facilitate end-to-end testing
across multiple domains: UI, API, and Database. The suite provides a unified structure to automate user interactions,
validate APIs, and verify data integrity, enabling a full spectrum of testing for web applications and backend services.

### **Key Features**

* **UI Testing**: Powered by the SeleniumLibrary, the framework automates user interactions in a web browser. This
  includes actions such as navigating web pages, interacting with forms, verifying UI elements, and validating dynamic
  content.
* **API Testing**: Using the RequestsLibrary for HTTP requests, the framework supports RESTful API testing. It allows
  for HTTP methods (GET, POST, PUT, DELETE), parameterization, response validation, and assertion of JSON data. This
  enables thorough validation of API endpoints and supports data-driven tests.
* **Database Testing**: Integrated with the DatabaseLibrary, this suite performs database operations and validations. It
  supports querying SQL databases, validating data integrity, and cross-checking data consistency between UI, API, and
  database layers, enhancing the accuracy of test coverage.

### **Framework Structure**

* **tests/** - Contains organized test cases for UI, API, and database testing, grouped by functionality and purpose.
* **resources/** - Shared resources, such as keywords, variables, and configuration files.
* **libraries/** - Custom Python libraries to extend Robot Framework's capabilities.
* **reports/** - Generated test reports and logs for easy test result analysis.

### Prerequisites

Before running this project, ensure you have the following installed:

* Python3
* pip (included with Python 3+)

### Installation

Use pip to install the required libraries:

```bash
pip install -r requirements.txt
```

### Run automation scripts

```bash
robot tests/filname.robot
```