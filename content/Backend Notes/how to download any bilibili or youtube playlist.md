## 🟥 Prerequisites
1. You have to have python installed in your machine.
2. keep this exe on "C:\Windows\System32" folder
   ![[yt-dlp.exe]]
3. Install `yt-dlp` using the following command:
   ```bash
   pip install yt-dlp
   ```

- 
- 
- 

## 🟥 simple way
### 👉 Youtube playlist/single video

```bash
yt-dlp -P "folder path" -f "137+140" --sleep-interval 3 --max-sleep-interval 8 "playlist link / single video link"
```

> **example:**

- for 1080p
```bash
yt-dlp -P "D:\downloades" -f "137+140" --sleep-interval 3 --max-sleep-interval 8 "https://www.youtube.com/playlist?list=PLu71SKxNbfoBGh_8p_NS-ZAh6v7HhYqHW"
```

- for downloading best quality and large file.. more time
```bash
yt-dlp -P "D:\downloades" -f "bestvideo+bestaudio" --sleep-interval 3 --max-sleep-interval 8 "https://www.youtube.com/playlist?list=PLu71SKxNbfoBGh_8p_NS-ZAh6v7HhYqHW"
```


---

### 👉 Bilibili playlist or single video

```bash
yt-dlp -P "folder path" -f "bestvideo+bestaudio" --sleep-interval 3 --max-sleep-interval 8 "playlist name with playlist code from bilibili"
```

example: (please keep the link simple with the video code only)

```bash
yt-dlp -P "D:\downloads" -f "bestvideo+bestaudio" --sleep-interval 3 --max-sleep-interval 8 "https://www.bilibili.com/video/BV1gH4y1M7os"
```

- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
- 
# ⚠️ Extra resources
## Steps to Download Videos

### 1. Open Command Prompt as Administrator
- Press `Win + S` and search for "cmd".
- Right-click on "Command Prompt" and select "Run as administrator."

### 2. Check Available Formats (Optional)

Before downloading, you can list all available formats for a video:
```bash
yt-dlp -F "https://www.bilibili.com/video/BV1gH4y1M7os"
```


### 3. Download a Single Video

To download a single video in the best available format:

- youtube:
```bash
yt-dlp -f "best" -P "<DOWNLOAD_PATH>" "<VIDEO_URL>"
```

- billibilli
```bash
yt-dlp -f "30080+30216" -P "<DOWNLOAD_PATH>" "<VIDEO_URL>"
```


### 4. Download a Playlist (Bilibili or YouTube)

- youtube:
```bash
yt-dlp -P "<DOWNLOAD_PATH>" -f "best" "<PLAYLIST_URL>"
```

- billibilli:
```bash
yt-dlp -P "<DOWNLOAD_PATH>" -f "30080+30216" "https://www.bilibili.com/video/BV1gH4y1M7os"
```

### 5. Download Specific Videos from a Playlist
To download specific videos (e.g., videos 10 to 20):
```bash
yt-dlp -P "<DOWNLOAD_PATH>" -f "best" --playlist-start 10 --playlist-end 20 "<PLAYLIST_URL>"
```


### 6. Use Random Delays Between Downloads
To reduce the risk of being rate-limited, add a random delay:
```bash
yt-dlp --sleep-interval 3 --max-sleep-interval 8 -P "<DOWNLOAD_PATH>" -f "best" "<PLAYLIST_URL>"
```
- This will add a delay of 3 to 8 seconds between downloads.


### 7. Use Cookies for Restricted Content
If a video or playlist requires login credentials, use browser cookies:
```bash
yt-dlp --cookies-from-browser chrome -P "<DOWNLOAD_PATH>" -f "best" "<VIDEO_URL>"
```
- Replace `chrome` with your browser (e.g., `firefox`, `edge`) if using a different one.

---

## Additional Tips
1. To customize filenames, use the `-o` option:
   ```bash
   yt-dlp -o "%(title)s.%(ext)s" -P "<DOWNLOAD_PATH>" -f "best" "<VIDEO_URL>"
   ```
2. Resume an interrupted download by simply rerunning the same command you ran at the beginning. it will check if the file/ files are downloaded or not.. then it will download the rest of the files. `yt-dlp` will pick up where it left off.


---

## Example Commands

### Download a Bilibili Playlist in 1080p:
```bash
yt-dlp -P "D:\\Videos\\Bilibili" -f "30080+30216" --sleep-interval 3 --max-sleep-interval 8 "https://www.bilibili.com/video/BV1gH4y1M7os"
```

### Download a YouTube Video in Best Quality:
```bash
yt-dlp -P "D:\\Videos\\YouTube" -f "best" "https://www.youtube.com/watch?v=example"
```


### Example of bilibili
```bash
yt-dlp -P "D:\mass downloader\[NEW] Master Microservices with SpringBoot,Docker,Kubernetes" -f "30080+30216" --sleep-interval 3 --max-sleep-interval 8 "https://www.bilibili.com/video/BV1gH4y1M7os"
```

### Example of youtube playlist 1080

```bash
yt-dlp -P "folder path" -f "137+140" --sleep-interval 3 --max-sleep-interval 8 "playlist link"
```







