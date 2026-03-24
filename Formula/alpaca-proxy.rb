class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.9"
  license "Apache-2.0"
  depends_on :macos

  if ENV["ALPACA_DEV"]
    url "https://github.com/vjeantet/alpaca/releases/download/v26.9/alpaca_v26.9-dev_darwin-arm64"
    sha256 "c1b5cbc2df0acb79724930a1d2b9b1ec643c1a3fb5e5ea24c012cc3e4ea196c8"
  else
    url "https://github.com/vjeantet/alpaca/releases/download/v26.9/alpaca_v26.9_darwin-arm64"
    sha256 "f649c68b86eb53379aae4897adc99f125e4baf4402c9dfb26871abe29b496f54"
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
