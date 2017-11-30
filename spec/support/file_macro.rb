ATTACHMENT_ROOT = Rails.root.to_s + "/spec/support/files"

def file_to_upload(file_location, mime_type)
  #need to require rack/test in the spec for uploading files
  Rack::Test::UploadedFile.new(file_location, mime_type)
end

def test_file
  File.open "#{ATTACHMENT_ROOT}/test_file.txt"
end

def test_picture
  File.open "#{ATTACHMENT_ROOT}/test_picture.jpg"
end

def web_test_file
  "#{ATTACHMENT_ROOT}/test_file.txt"
end

def delete_files
  `rm -rf #{Rails.root}/tmp/uploads`
end
