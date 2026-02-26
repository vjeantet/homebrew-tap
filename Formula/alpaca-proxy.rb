class AlpacaProxy < Formula
  desc "Local HTTP proxy with PAC, NTLM, Basic and Kerberos authentication"
  homepage "https://github.com/vjeantet/alpaca"
  version "26.1"
  license "Apache-2.0"
  depends_on :macos

  on_arm do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.1/alpaca_v26.1_darwin-arm64"
    sha256 "a6425b4db9e35fb53cd8779ccf4b9303975d9d5796220e7910a49f5c931ab009"
  end

  on_intel do
    url "https://github.com/vjeantet/alpaca/releases/download/v26.1/alpaca_v26.1_darwin-amd64"
    sha256 "48f784f0caeba8bbbe523acd7fcbd88a1722f3a2412f65f8218ff24775de3126"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "alpaca"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/alpaca -version")
  end
end
