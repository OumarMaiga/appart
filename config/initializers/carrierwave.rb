CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: "AWS",
        region: "us-east-2",
        aws_access_key_id: "AKIAJB6M6F5YQ6UVKRAQ",
        aws_secret_access_key: "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"
    }
    config.fog_directory = "appartml"
end