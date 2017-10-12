class Song < ApplicationRecord
  mount_uploader :file, SongUploader
  acts_as_taggable

  attr_accessor :youtube_url

  before_save do
    if @youtube_url.to_s.match?(/^https:\/\/(www\.)?youtube\.\w+\/watch\?v=[\w-]+$/)
      infos = JSON.parse(`#{YOUTUBE_DL} -x --audio-format vorbis "#{@youtube_url}" -j`)
      id = infos["id"]
      raise "No id found" if id.to_s.empty?
      file_name = "#{id}.ogg"
      @youtube_dl_path = "public/uploads/tmp/#{file_name}"
      `mkdir -p public/uploads/tmp && cd public/uploads/tmp && #{YOUTUBE_DL} -x --audio-format vorbis "#{youtube_url}" -o #{file_name}`
      self.file = File.open @youtube_dl_path
      self.source = @youtube_url
      self.duration ||= infos["duration"]
      self.author ||= infos["uploader"]
      self.tag_list ||= infos["tags"]
    else
      puts "Invalid youtube_url (#{@youtube_url})"
    end
  end

  after_save do
    puts "Youtubedl tmp = #{@youtube_dl_path}"
  end
end
