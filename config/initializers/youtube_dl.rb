youtube_dl = `which youtube-dl`.chomp
YOUTUBE_DL = youtube_dl.match?(/^which: no youtube-dl/) ? nil : youtube_dl
