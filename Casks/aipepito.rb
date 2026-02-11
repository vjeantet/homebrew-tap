cask "aipepito" do
  version "26.6"
  sha256 "6a335fc08bd6fa3326f48674aeae3a28daa3d8e8bbd8b1775278e824b73c428d"

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
