class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.3"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.3/alpaca_v26.3_darwin-arm64"
    sha256 "d3a4a552209181240939b72e6029f2eb95d1862ae0f33c9c54c4b5eb5b5a532a"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.3/alpaca_v26.3_darwin-amd64"
    sha256 "40597e023aaf58e06f9346d9f6767cdd560715b10a257ee9c8563dca55b6b28c"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "alpaca"
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
