class Song < ApplicationRecord
  mount_uploader :file, SongUploader
  acts_as_taggable

  self.per_page = 10

  attr_accessor :youtube_url

  after_validation do
    if YOUTUBE_DL && @youtube_url
      if @youtube_url.to_s.match?(/^https:\/\/(www\.)?youtube\.\w+\/watch\?v=[\w-]+$/)
        infos = JSON.parse(`#{YOUTUBE_DL} -x --audio-format vorbis "#{@youtube_url}" -j`)
        id = infos["id"]
        raise "No id found" if id.to_s.empty?
        file_name = "#{id}.ogg"
        @youtube_dl_path = "public/uploads/tmp/#{file_name}"
        `mkdir -p public/uploads/tmp && cd public/uploads/tmp && #{YOUTUBE_DL} -x --audio-format vorbis "#{@youtube_url}" -o #{file_name}`
        self.file = File.open @youtube_dl_path
        self.source = @youtube_url
        self.title ||= infos["title"]
        self.duration ||= infos["duration"]
        self.author ||= infos["uploader"]
        self.tag_list = infos["tags"] if self.tag_list.empty?
      else
        puts "Invalid youtube_url (#{@youtube_url})"
      end
    end
  end

  after_save do
    File.delete @youtube_dl_path if @youtube_dl_path
  end

  filterrific(
    available_filters: [
      :with_attr_stress_gte,
      :with_attr_epicness_gte,
      :with_attr_happiness_gte,
    ]
  )

  scope :with_attr_stress_gte, lambda { |ref|
    where("attr_stress >= ?", ref)
  }

  scope :with_attr_epicness_gte, lambda { |ref|
    where("attr_epicness >= ?", ref)
  }

  scope :with_attr_happiness_gte, lambda { |ref|
    where("attr_happiness >= ?", ref)
  }

  # def self.options_for_sorted_by
  #   [
  #     ['Attribut Stress (0-100)', 'attr_stress_asc']
  #   ]
  # end
end
