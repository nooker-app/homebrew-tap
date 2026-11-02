cask "nook" do
  version "0.1.63"
  sha256 "0af698b1f93abc4920ba8977130b990682d13f744a21c764aa98c2284a013988"

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
