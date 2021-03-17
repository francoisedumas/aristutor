Google::Cloud::Translate.configure do |config|
  config.credentials = ENV['TRANSLATE_CREDENTIALS']
end
