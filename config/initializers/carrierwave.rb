CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: "AWS",
        region: "us-east-2",
        aws_access_key_id: "AKIAISP7TJBUTHTLLNUQ",
        aws_secret_access_key: "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"
    }
    config.fog_directory = "appartml"
end