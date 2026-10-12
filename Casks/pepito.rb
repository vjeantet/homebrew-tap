cask "pepito" do
  version "26.46"
  sha256 "57e4b6a30ed7f53159ce2293a6e99243f90857ba9affcddd1510fa1a646dbeaa"

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
