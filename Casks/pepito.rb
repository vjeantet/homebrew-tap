cask "pepito" do
  version "26.29"
  sha256 "5506b4383aa6dfa6881e8bdaa0a966168d2dabb67acf162fcd59adc2056c0795"

  url "https://github.com/vjeantet/aipepito-releases/releases/download/v#{version}/pepito.dmg"
  name "pepito"
  desc "Meeting recording with automatic transcription and AI-generated reports"
  homepage "https://github.com/vjeantet/pepito-releases"

  depends_on macos: ">= :sonoma"

  app "pepito.app"

  zap trash: [
    "~/Library/Preferences/fr.sodadi.pepito.plist",
  ]
end
