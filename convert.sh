---

# ২. 360p রেজুলেশন

### `convert.sh`

```bash
#!/data/data/com.termux/files/usr/bin/bash

mkdir -p /sdcard/Movies/HighS_360p

for file in /sdcard/Download/HighS/*; do
  filename=$(basename "$file")
  output="/sdcard/Movies/HighS_360p/$filename"

  if [ -f "$output" ]; then
    echo "Skipping already converted: $filename"
    continue
  fi

  echo "Converting (360p): $filename"
  ffmpeg -i "$file" \
    -vf "scale=640:360,setdar=16/9" \
    -c:v libx264 -preset ultrafast -crf 28 \
    -c:a aac -b:a 96k \
    "$output"
done
