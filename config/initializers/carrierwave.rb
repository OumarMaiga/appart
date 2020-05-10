CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: "AWS",
        region: "us-east-2",
        aws_access_key_id: "AKIAIGACB2CKDMIHLT4A",
        aws_secret_access_key: "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"
    }
    config.fog_directory = "appartml"
end