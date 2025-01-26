<h1 align="center">streaming-video-downloader</h1>
<h2 align="center">Download live streams from Twitch and other livestreaming services</h2>

<br/>

<p align="center">
    <img src="https://img.shields.io/badge/Bash-00000F?style=flat&logo=gnu-bash" alt="Bash badge"/>
    <img src="https://img.shields.io/badge/Docker-1D63ED?style=flat&logo=docker&logoColor=white" alt="Docker badge"/>
</p>

Streaming-video-downloader is a tool to download live streams from services like Twitch, it monitors every 60 seconds for new livestreaming and start downloading them.
Powered by [Streamlink](https://streamlink.github.io/)

## 🚀 Running

### 🐋 Run with Docker

```YAML
version: '3.8'
services:
  streaming-video-downloader:
    container_name: 'streaming-video-downloader'
    image: 'ghcr.io/jmorbegoso/streaming-video-downloader:latest'
    restart: 'always'
    user: '1001:1001'
    environment:
      - 'TWITCH_CHANNELS=https://www.twitch.tv/twitch https://www.twitch.tv/xbox'
      - 'STREAM_QUALITY=best'
      - 'STREAM_OPTIONS=--twitch-disable-reruns --twitch-disable-ads'
    volumes:
      - '/etc/localtime:/etc/localtime:ro'
      - '~/downloads:/output:rw'
```

#### Environment variables

| Variable        | Function                                                            |
| --------------- | ------------------------------------------------------------------- |
| TWITCH_CHANNELS | Declaration of the Twitch channels to monitorize (space separated). |
| STREAM_QUALITY  | Quality of the streams to download.                                 |
| STREAM_OPTIONS  | Aditional Streamlink parameters.                                    |

## 🧑‍💻 Author

**JMOrbegoso**

- Website: [www.jmorbegoso.dev](https://www.jmorbegoso.dev)
- Blog: [blog.jmorbegoso.dev](https://blog.jmorbegoso.dev)
- Github: [@JMOrbegoso](https://github.com/JMOrbegoso/)
- LinkedIn: [@jmorbegosodev](https://www.linkedin.com/in/jmorbegosodev/)
