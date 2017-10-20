# audio = document.getElementById('player')
# audio.addEventListener 'ended', ->
#   audio.src = 'nextAudio.mp3'
#   audio.play()
#   return
getMusicUrls = () ->
  $(".ap-playlist audio") #.map (i, e) -> e.src

stopMusic = (player) ->
  musics = getMusicUrls()
  if musics.length > player.current_music_id
    current_music = musics[player.current_music_id]
    current_music.pause()

startMusic = (player) ->
  musics = getMusicUrls()
  if player.current_music_id < 0
    player.current_music_id += musics.length
  # Start from current
  if musics.length > player.current_music_id
    current_music = musics[player.current_music_id]
    current_music.play()
    # Auto next
    current_music.addEventListener 'ended', (event) ->
      player.current_music_id += 1
      startMusic(player)
  # Restart from 0 (loop)
  else if musics.length > 0
    player.current_music_id = 0
    startMusic(player)

$(document).on 'turbolinks:load', ->
  #startMusic(player)
  player = $(".audioplayer")[0]
  player.current_music_id = 0
  $("button.ap-play").on 'click', ->
    startMusic(player)
  $("button.ap-pause").on 'click', ->
    stopMusic(player)
  $("button.ap-prev").on 'click', ->
    stopMusic(player)
    player.current_music_id -= 1
    startMusic(player)
  $("button.ap-next").on 'click', ->
    stopMusic(player)
    player.current_music_id += 1
    startMusic(player)
