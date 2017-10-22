# List the current musics of the playlist
# TODO: argument .player
getMusicUrls = () ->
  musics = $(".ap-playlist audio")
  return musics

# Stop the current audio track
stopMusic = (player) ->
  player.musics.each (i, audio) ->
    audio.pause()
  # if player.musics.length > player.current_music_id
  #   current_music = player.musics[player.current_music_id]
  #   current_music.pause()

# Start the audio track pointed by current_music_id
startMusic = (player) ->
  if player.musics.length > 0
    # Set valid a id
    player.current_music_id = (player.current_music_id + player.musics.length) % player.musics.length
    # Start from current
    if player.musics.length > player.current_music_id
      player.musics[player.current_music_id].play()

setupMusicsNextAudio = (event) ->
  audio = event.target
  stopMusic(audio.player)
  audio.player.current_music_id = audio.index + 1
  startMusic(audio.player)

# Set the audio events of the current playlist
setupMusics = (player) ->
  player.musics.each (i, audio) ->
    audio.index = i
    audio.player = player
    audio.removeEventListener 'ended', setupMusicsNextAudio
    audio.addEventListener 'ended', setupMusicsNextAudio

$(document).on 'turbolinks:load', ->
  player = $(".audioplayer")[0]
  player.musics = getMusicUrls()
  player.current_music_id = 0
  setupMusics(player)

  # TODO: bind event CHANGE ot update the musics
  $("button.ap-play").on 'click', ->
    stopMusic(player)
    # wtf ? why ? I hate js
    window.setTimeout ->
      player.musics = getMusicUrls()
      setupMusics(player)
      startMusic(player)
    , 500
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
