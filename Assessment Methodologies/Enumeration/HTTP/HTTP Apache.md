 - Runs on Linux

### Using `nmap`

```
nmap -p 80 -sV --script banner <target-ip>
```

- **Banner**- Banner is the info a computer receives the first time they connect to a machine.

### Using `metasploit`

- Performs a http version scan:
```
use auxiliary/scanner/http/http_version
```

- Performs directory bruteforce:
```
use auxiliary/scanner/http/brute_dirs
```

- Enumerates `robots.txt` file:
```
use auxiliary/scanner/http/robots_txt
```

### Using `curl`

```
curl <target-ip> | more
```

- The `curl` command, by default, retrieves the complete HTTP response, including the headers and body. It shows the HTML header information and potentially any inline CSS styles when you run the command.

### Using `wget`

```
wget "http://<web-ip>/index"
```

- `wget` is used to retrieve web files.

### Using `lynx`

```
lynx http://<web-ip>
```

Renders web pages in the terminal like `browsh`, but with less GUI and easier to read. 