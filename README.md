# Assemble — BAM's internal video calls

Every call is transcribed per speaker, recorded (no faces), summarized by AI,
filed to Google Drive, and mined for action items that follow up with you on
Slack. A voice assistant (Nimbus) and the librarian (Conan) sit in on every
call.

## Install (Mac, Apple Silicon)

Paste this in Terminal — installs to /Applications with no security warnings:

```bash
curl -fsSL https://raw.githubusercontent.com/tyler-bam-ai/assemble-app/main/install.sh | bash
```

Or download the **.dmg** from
[Releases](https://github.com/tyler-bam-ai/assemble-app/releases/latest), open
it, and drag **Assemble** to Applications. (Use the .dmg in the browser — the
.zip is for the install script and the auto-updater.)

Assemble updates itself: the meeting software updates live from the office
server, and the app shell checks for new versions automatically.

The app needs to reach the BAM office Assemble server (LAN / VPN).
