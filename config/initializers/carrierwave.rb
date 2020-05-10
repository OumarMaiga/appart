CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: "AWS",
        region: "us-east-2",
        aws_access_key_id: "ACCESS_KEY_ID",
        aws_secret_access_key: "SECRET_ACCESS_KEY"
    }
    config.fog_directory = "appartml"
end