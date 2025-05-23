# workingwithwebhook

Webhook Repo: https://github.com/adnanh/webhook

## Setup

1. If on a Mac, install webhook with Homebrew:
```bash
brew install webhook
``` 
2. If on Linux install with apt
3. If on Windows, clone the repo and build from source
4. Create a hooks.json file somewhere. There is an example in this repo.
5. Put the path to the hooks.json file in the webhookmonitor.sh script
6. Make the webhookmonitor.sh script executable:
```bash
chmod +x webhookmonitor.sh
```
7. Run the webhookmonitor.sh script:
```bash
./webhookmonitor.sh
```
8. If on a Mac, setup the service to run at startup:
```bash
sudo cp local.webhook.plist /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/local.webhook.plist
```
9. Put the createobsidianfile.sh script somewhere. 
10. Put the path to the createobsidianfile.sh script in the hooks.json file
