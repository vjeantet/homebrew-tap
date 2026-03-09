class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.8"
  license "Apache-2.0"
  depends_on :macos

  if ENV["ALPACA_DEV"]
    url "https://github.com/vjeantet/alpaca/releases/download/v26.8/alpaca_v26.8-dev_darwin-arm64"
    sha256 "d671503d2fc49c37376f3a58a25dccbf61d33980568a7872757a2cc3219f82fe"
  else
    url "https://github.com/vjeantet/alpaca/releases/download/v26.8/alpaca_v26.8_darwin-arm64"
    sha256 "8e9cc0a28464a3c57dfc3ef87b896b2f5d46b1f2e3b6b391f5ef35903e119e06"
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
