Rails.application.config.middleware.insert_before 0, Rack::Cors do
  
    if Rails.env.production?
      allow do
        origins 'https://realserver.com'
        resource '*', header: :any, method: %i[get post patch delete options head], credentials: true
      end
    else
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i[get post put patch delete options head], credentials: false
    end
  end
end