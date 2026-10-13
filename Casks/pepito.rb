cask "pepito" do
  version "26.48"
  sha256 "c156b7c53eaf56011b7e40e51dddbb2523e03debae31a2f53ddb05f2e3e80737"

  url "https://github.com/vjeantet/pepito-releases/releases/download/v#{version}/pepito.dmg"
  name "pepito"
  desc "Meeting recording with automatic transcription and AI-generated reports"
  homepage "https://github.com/vjeantet/pepito-releases"

  depends_on macos: ">= :tahoe"

  app "pepito.app"

  zap trash: [
    "~/Library/Preferences/fr.sodadi.pepito.plist",
  ]
end
