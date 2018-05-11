class Video < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user_id

  mount_uploader :video, VideoUploader
end
