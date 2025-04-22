# things-setup

## 📦 debian-docker-install.sh

Contains a shell script to easily install Docker Engine and related tools on a Debian-based system.

### ✅ Installation (via `curl`)

You can run the script directly using `curl` (no need to clone the repository):

```bash
curl -fsSL https://raw.githubusercontent.com/aming0/things-setup/main/debian-docker-install.sh -o debian-docker-install.sh
chmod +x debian-docker-install.sh
./debian-docker-install.sh
```
To verify that Docker is installed correctly:

```bash
docker run hello-world
```
