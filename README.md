# gcloud-terminal-shell-exfiltration
Script that exfiltrate gcloud terminal app informations from a local machine to a remote server

# Warning
This script is intended as a proof of concept. Don't use it for malicious purpose.

# Concept
This script works only on Linux at the moment and its goal it's to exfiltrate gcloud terminal app informations.

# How to use it

Edit the following variables in **exfiltrate.sh**:
* REMOTE_USER (the remote user of your ssh server)
* REMOTE_IP  (the ip of your ssh server)
* REMOTE_PATH  (the remote path where you want to save the exfiltrated data)

After that, run the script on a machine where there is google cloud terminal application. At the end you will mainly found some interesting db such as:
* access_tokens.db
* credentials.db
* default_configs.db

# Analysis of google cloud terminal app databases

The databases are made with sqlite, but they are encrypted to view the content of those db, it is suggested to download **sqlcipher**:
```
sudo apt install -y sqlcipher
```
After installing it, run:
```
sqlcipher DB
```
Where DB may be:
* access_tokens.db
* credentials.db
* default_configs.db

The most interesting db is access_tokens.db in which there are stored the oauth2 access tokens for each profile. The only available table in that db is access_tokens which has the following columns:
*account_id (gmail account)
*access_token (access token)
*token_expiry (token expiration as a date)
*rapt_token
*id_token
