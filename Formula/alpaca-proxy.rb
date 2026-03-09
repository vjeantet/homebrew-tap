class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.7"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    if ENV["ALPACA_DEV"]
      url "https://github.com/vjeantet/alpaca/releases/download/v26.7/alpaca_v26.7-dev_darwin-arm64"
      sha256 "75f38ed68d6adbf531a897ab868ce99e336bb77cb4b0b0d653782291fa5b83e9"
    else
      url "https://github.com/vjeantet/alpaca/releases/download/v26.7/alpaca_v26.7_darwin-arm64"
      sha256 "a36e30f5e4d8abe816932ba0454972542f1472053ce9d543a35dbd493f086793"
    end
  end

  on_intel do
    if ENV["ALPACA_DEV"]
      url "https://github.com/vjeantet/alpaca/releases/download/v26.7/alpaca_v26.7-dev_darwin-amd64"
      sha256 "8faedf738f71fb76d54e081d08665077e9ebf2c681fae85ddb7bbc7142fbc0f0"
    else
      url "https://github.com/vjeantet/alpaca/releases/download/v26.7/alpaca_v26.7_darwin-amd64"
      sha256 "bcbcd2cf1b496c5349d8aff61469e97f0862e1903b283624850d1f7191426280"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "alpaca"
  end

  def caveats
    <<~EOS
      On first launch, a default configuration file will be created at:
        ~/.config/alpaca/config.yaml

      Edit it to set your proxy settings, then start the service with:
        brew services start alpaca-proxy

      To configure your terminal to use Alpaca as proxy, add to your shell profile:
        export http_proxy=http://localhost:8079
        export https_proxy=http://localhost:8079

      The logs are in:
        /opt/homebrew/var/log/alpaca-proxy.log

    EOS
  end

  service do
    run [opt_bin/"alpaca"]
    keep_alive true
    log_path var/"log/alpaca-proxy.log"
    error_log_path var/"log/alpaca-proxy.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/alpaca -version")
  end
end
