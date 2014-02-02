class ModelUpload < ActiveRecord::Base
  has_attached_file :stlfile
  # validates_attatchment_content_type :stlfile, :content_type => application/octet-stream
end
