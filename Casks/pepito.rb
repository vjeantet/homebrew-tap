cask "pepito" do
  version "26.67"
  sha256 "1df20bae693efb55e3f14d951d05c066349a12152c25a412017424bd298c51e1"

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
