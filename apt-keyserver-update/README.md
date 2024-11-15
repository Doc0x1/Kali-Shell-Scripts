# apt-keyserver-update

### Purpose
- If you've ever encountered a message like "The following signatures couldn't be verified because the public key is not available: NO_PUBKEY..." when trying to run `apt update`, then this script should fix that.

### Usage
```
chmod +x update-keyserver.sh
sudo bash update-keyservers.sh
```
- The script will run apt-get update and check the output for messages on missing key IDs. 
- Afterwards it will iterate over each one missing a key ID and update apt using the appropriate keyservers to verify it was successful.