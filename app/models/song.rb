class Song < ApplicationRecord
  mount_uploader :file, SongUploader
  acts_as_taggable
end
