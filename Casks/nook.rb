cask "nook" do
  version "0.1.67"
  sha256 "c33e49048ac5e7981a7bf77c260189588c686b3d4f8674029197c3a8f5f084e7"

  url "https://github.com/nooker-app/nook/releases/download/v#{version}/Nook-#{version}.dmg"
  name "Nook"
  desc "Native RSS reader that keeps your feeds in a plain folder"
  homepage "https://www.nooker.app/download/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Nook.app"

  zap trash: [
    "~/Library/Application Support/Nook",
    "~/Library/Caches/com.tim.nook",
    "~/Library/HTTPStorages/com.tim.nook",
    "~/Library/Preferences/com.tim.nook.plist",
    "~/Library/Saved Application State/com.tim.nook.savedState",
  ]
end
