class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.2"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.2/alpaca_v26.2_darwin-arm64"
    sha256 "097e33b1d3a9cc5e26d86f9431c756eb39d7a3d1fe38b1079c2114222b8be1ed"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.2/alpaca_v26.2_darwin-amd64"
    sha256 "8116bf1fd6b28ea2db80253a453feb0833202db3dc999b84a955b244554c85ac"
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
