cask "pepito" do
  version "26.31"
  sha256 "05c0f62acaf9c8dc322b7b6871d41bb5aa4b9d2bf9e0b1f98f6b283334a2274f"

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
