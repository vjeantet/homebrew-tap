cask "aipepito" do
  version "26.9"
  sha256 "826fb8f86a75ee26ad38460e989e079109ce3106c275a198ce5856e257aca4a5"

  url "https://github.com/vjeantet/aipepito-releases/releases/download/v#{version}/AIPepito.dmg"
  name "AIPepito"
  desc "Meeting recording with automatic transcription and AI-generated reports"
  homepage "https://github.com/vjeantet/aipepito-releases"

  depends_on macos: ">= :sonoma"

  app "AIPepito.app"

  zap trash: [
    "~/Library/Preferences/fr.sodadi.aipepito.plist",
  ]
end
