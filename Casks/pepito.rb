cask "pepito" do
  version "26.39"
  sha256 "2a7b1379c517aede16de2e18064e273de9bbaa93f02616737ac3f6bb60da500e"

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
