OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           '106687523855-td8fmua353okgu2dsmgfhdginh6l2kdu.apps.googleusercontent.com',
           'eXQc2FIFT_PkrOgoENTgAXEt',
           {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end