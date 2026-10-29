cask "pepito" do
  version "26.62"
  sha256 "b355c76ea341893211d57aa771c74f38a762668ccb763820025a2c55d5ccc3b0"

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
