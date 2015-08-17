## AWS configuration
aws_config_path = File.join(Rails.root, 'config', 'aws.yml')
raise "#{aws_config_path} is missing!" unless File.exists? aws_config_path

aws_config = YAML.load_file(aws_config_path)[Rails.env].symbolize_keys

# Fog configurations
if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
                    provider: 'AWS',
           aws_access_key_id: aws_config[:access_key],
       aws_secret_access_key: aws_config[:secret_key]
    }

    config.fog_directory    = aws_config[:fog_directory]
    config.fog_public       = true
    config.fog_attributes   = {'Cache-Control'=>'max-age=315576000'}
  end
end
