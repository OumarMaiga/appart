CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: "AWS",
        region: "us-east-2",
        aws_access_key_id: "*************************************",
        aws_secret_access_key: "***************************************"
    }
    config.fog_directory = "appartml"
end