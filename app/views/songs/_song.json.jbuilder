json.extract! song, :id, :title, :file, :source, :author, :duration, :loop, :attr_stress, :attr_epicness, :attr_happiness, :created_at, :updated_at
json.url song_url(song, format: :json)
