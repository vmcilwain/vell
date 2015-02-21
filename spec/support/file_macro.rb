def file_to_upload(file_location, mime_type)
  #need to require rack/test in the spec for uploading files
  Rack::Test::UploadedFile.new(file_location, mime_type)
end