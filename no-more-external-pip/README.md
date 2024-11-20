# No More External Pip

## Purpose
### If you've ever encountered a message when using `pip install <package>` that said:

```txt
To install Python packages system-wide, try apt install
 python3-xyz, where xyz is the package you are trying to
 install.
 ```

Then you've probably been annoyingly passing in `--break-system-packages` at the end of pip.

This script will remove the files that cause this message.

## Usage
### Note: Must be run with sudo

```
chmod +x ./no-more-external-pip.sh
sudo bash ./no-more-external-pip.sh
```

The script will find all EXTERNALY-MANAGED files for the Python versions installed on the Linux system and remove them.

Afterwards you won't have to worry about any more issues using pip install without venv.
