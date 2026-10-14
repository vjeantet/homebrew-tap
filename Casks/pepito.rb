cask "pepito" do
  version "26.49"
  sha256 "772977688dbaaf8d96797841339b5623c5d92d7d1003bb3d70579ff6cad07594"

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
