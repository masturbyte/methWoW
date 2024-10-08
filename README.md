# methWoW - PUT RCE Checker

`methwow` is a simple Bash script designed to test if a website or subdomains allow file uploads using the HTTP `PUT` method, which can be exploited to achieve Remote Code Execution (RCE). The script checks available HTTP methods and attempts to upload a sample file (`wow.txt`) using the `PUT` method, then retrieves it with a `GET` request to verify success.
![image](https://github.com/user-attachments/assets/16795bd1-9767-4e73-aaa1-da1d4e64a388)

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
   git clone https://github.com/masturbyte/methwow.git
   cd methwow
   chmod +x methWOW.sh
## Usage

### Running the Script

To run the script, you need to provide either a single domain or a file containing a list of subdomains. 

#### Single Domain

To check a single domain, use the following command:

```bash
./methwow.sh https://www.example.com
```
#### List of Subdomains

To check multiple subdomains from a file, use the following command:

```bash
./methwow.sh subdomains.txt
```

```bash

███▄ ▄███▓▓█████▄▄▄█████▓ ██░ ██  █     █░ ▒█████   █     █░ 
▓██▒▀█▀ ██▒▓█   ▀▓  ██▒ ▓▒▓██░ ██▒▓█░ █ ░█░▒██▒  ██▒▓█░ █ ░█░ 
▓██    ▓██░▒███  ▒ ▓██░ ▒░▒██▀▀██░▒█░ █ ░█ ▒██░  ██▒▒█░ █ ░█ 
▒██    ▒██ ▒▓█  ▄░ ▓██▓ ░ ░▓█ ░██ ░█░ █ ░█ ▒██   ██░░█░ █ ░█ 
▒██▒   ░██▒░▒████▒ ▒██▒ ░ ░▓█▒░██▓░░██▒██▓ ░ ████▓▒░░░██▒██▓ 
░ ▒░   ░  ░░░ ▒░ ░ ▒ ░░    ▒ ░░▒░▒░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▓░▒ ▒ 
░  ░      ░ ░ ░  ░   ░     ▒ ░▒░ ░  ▒ ░ ░    ░ ▒ ▒░   ▒ ░ ░ 
       ░      ░  ░         ░  ░  ░    ░        ░ ░      ░ 
         made it by : @masturbyte | Ahmed Kori

[*] https://subdomain1.example.com allows: [GET POST PUT DELETE]
[+] Successfully uploaded wow.txt to https://subdomain1.example.com/wow.txt

[*] https://subdomain2.example.com allows: [GET POST DELETE]
[-] Failed to upload wow.txt to subdomain2.example.com
```

