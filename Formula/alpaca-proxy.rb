class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.6"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.6/alpaca_v26.6_darwin-arm64"
    sha256 "a7fcf4d1d4a6206682a29a8194c024ce07b15feb44b96cc282ab2ce095d5d5e9"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.6/alpaca_v26.6_darwin-amd64"
    sha256 "21e73de8455c5bbeab08bb550a895fef04867d9c16c7fe0fe829aa9efb454330"
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
