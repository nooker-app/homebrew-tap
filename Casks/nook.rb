cask "nook" do
  version "0.1.70"
  sha256 "e910ad5cec7624a0fdb5b7e1c8d8303b1226eb55a513b763898e074269202023"

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
