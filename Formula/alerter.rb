class Alerter < Formula
  desc "macOS notification CLI — send native notifications and capture user interactions"
  homepage "https://github.com/vjeantet/alerter"
  version "26.5"
  url "https://github.com/vjeantet/alerter/releases/download/v#{version}/alerter-#{version}.zip"
  sha256 "11f63cddc9bb3f8554ed9b762632a120cfa7bee05e3c09d65734823e09d24f10"
  license "MIT"

  depends_on :macos

  def install
    bin.install "alerter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/alerter --version")
  end
end
