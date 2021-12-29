# Crypto-CBC-Tool

### Tools (in a docker container) to decrypt text encrypted with Crypt::CBC <= v2.15 and encrypt with current Crypt::CBC

- To build and run the container
``` 
docker build -t enctool . # only needed the first time you use the tool
docker run -ti enctool /bin/bash
```

- Once in the container, use the following commands to decrypt/encrypt
```
decrypt '<key>' '<ciphertext>'
encrypt '<key>' '<plaintext>'
```

Or, if you just want get the new encrypted string in a single command...
```
export KEY='<key>'; encrypt ${KEY} $(decrypt ${KEY} '<ciphertext>')
```
