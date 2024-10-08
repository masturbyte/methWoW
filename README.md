# methwow - PUT RCE Checker

`methwow` is a simple Bash script designed to test if a website or subdomains allow file uploads using the HTTP `PUT` method, which can be exploited to achieve Remote Code Execution (RCE). The script checks available HTTP methods and attempts to upload a sample file (`wow.txt`) using the `PUT` method, then retrieves it with a `GET` request to verify success.

## Features

- **Check HTTP Methods:** Verify if the `PUT` method is allowed on a target website or subdomains.
- **File Upload Test:** Automatically uploads a small file (`wow.txt`) using the `PUT` method.
- **Success Verification:** Confirms if the file upload was successful using a `GET` request.
- **Batch Mode:** Works with a single domain or a list of subdomains from a file.

## Requirements

There are no additional dependencies required for this script. It only uses built-in Linux/Unix tools such as `curl`.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/username/methwow.git
   cd methwow
   chmod +x methwow.sh

