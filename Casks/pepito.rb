cask "pepito" do
  version "26.33"
  sha256 "eed32903111c9f603be2ae8e04292dbf36841013755d829d90580e72bcfb2181"

  url "https://github.com/vjeantet/aipepito-releases/releases/download/v#{version}/pepito.dmg"
  name "pepito"
  desc "Meeting recording with automatic transcription and AI-generated reports"
  homepage "https://github.com/vjeantet/pepito-releases"

  depends_on macos: :sonoma

  app "pepito.app"

  zap trash: [
    "~/Library/Preferences/fr.sodadi.pepito.plist",
  ]
end
