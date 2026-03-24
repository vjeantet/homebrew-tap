class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.10"
  license "Apache-2.0"
  depends_on :macos

  if ENV["ALPACA_DEV"]
    url "https://github.com/vjeantet/alpaca/releases/download/v26.10/alpaca_v26.10-dev_darwin-arm64"
    sha256 "7701176187c4f02883a90f6858ed518d679c231d8c9525394336822f2929fc0b"
  else
    url "https://github.com/vjeantet/alpaca/releases/download/v26.10/alpaca_v26.10_darwin-arm64"
    sha256 "1c9646acf929f1d86a8f132c3f00e24bc69bfe2c6bf7f4a7198252efd18b9578"
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
