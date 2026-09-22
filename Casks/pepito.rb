cask "pepito" do
  version "26.34"
  sha256 "227031b3d3e92cb9f3f30824e29b8e7b97d58e4ee4063a95bc4ab1defa31cb46"

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
