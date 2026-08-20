cask "nook" do
  version "0.1.56"
  sha256 "440c5f3b588d0da59c7ce46799d580f841705ef80ce13dafb8d9a3571586015c"

  url "https://github.com/nooker-app/nook/releases/download/v#{version}/Nook-#{version}.dmg"
  name "Nook"
  desc "Native RSS reader that keeps your feeds in a plain folder"
  homepage "https://github.com/nooker-app/nook"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Nook.app"

  zap trash: [
    "~/Library/Preferences/com.tim.nook.plist",
    "~/Library/Caches/com.tim.nook",
    "~/Library/HTTPStorages/com.tim.nook",
    "~/Library/Application Support/Nook",
    "~/Library/Saved Application State/com.tim.nook.savedState",
  ]

  caveats <<~CAVEAT
    Nook is ad-hoc signed (not notarized), so macOS may block it on first launch.
    Right-click Nook in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/Nook.app"

    To skip that next time, install without quarantine:
      HOMEBREW_CASK_OPTS="--no-quarantine" brew install --cask nooker-app/tap/nook
  CAVEAT
end
