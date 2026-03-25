class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.11"
  license "Apache-2.0"
  depends_on :macos

  if ENV["ALPACA_DEV"]
    url "https://github.com/vjeantet/alpaca/releases/download/v26.11/alpaca_v26.11-dev_darwin-arm64"
    sha256 "561e31a1f5235b023ffce906a03f1bf922df85bfa51a9eaa40be8a2cc8ffcb92"
  else
    url "https://github.com/vjeantet/alpaca/releases/download/v26.11/alpaca_v26.11_darwin-arm64"
    sha256 "cb5d01c6c6cde2bfc8dad8d39f93dd212feadb52229142661c619a2150b6b89f"
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
