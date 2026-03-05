class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.5"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.5/alpaca_v26.5_darwin-arm64"
    sha256 "34f9110cf5f71e18614d746f5fed29541b349e64dda917eb6d8187c3b80e9da4"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.5/alpaca_v26.5_darwin-amd64"
    sha256 "273b3e1c36aaaeeb6647d5ced6bc95b4f6b3fccc06f64d5dafb612d6f2804855"
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
