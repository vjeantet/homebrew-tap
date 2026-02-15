cask "aipepito" do
  version "26.13"
  sha256 "b066faee71b2f2355dee38eab505b29b75e34fa0a96e37fcd3b56754fd67729e"

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
