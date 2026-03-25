class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.12"
  license "Apache-2.0"
  depends_on :macos

  url "https://github.com/vjeantet/alpaca/releases/download/v26.12/alpaca_v26.12_darwin-arm64"
  sha256 "6d696b0d2fb44b9f2357fbdf5aae6c1f7588f84a5bb9d0dff9f8a3c07f7c299c"
  
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
