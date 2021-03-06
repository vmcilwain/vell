ALLOWABLE_IMAGES = ["image/gif", "image/jpeg", "image/jpg", "image/png"]

ALLOWABLE_APPLICATIONS = ["application/vnd.oasis.opendocument.text",
"application/vnd.oasis.opendocument.spreadsheet",
"application/vnd.oasis.opendocument.presentation",
"application/vnd.ms-excel",
"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
"application/vnd.ms-powerpoint",
"application/vnd.openxmlformats-officedocument.presentationml.presentation",
"application/vnd.openxmlformats-officedocument.wordprocessingml.document",
"application/vnd.ms-word", "application/pdf", "text/plain", "application/zip", "application/x-zip", "application/octet-stream"]

FADE_OUT_TIME = 3000

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
