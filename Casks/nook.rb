cask "nook" do
  version "0.1.39"
  sha256 "d87d60b1a89b72cb290b625426af76d3bdc804fa69f9c625dc8842dd9378af7c"

  url "https://github.com/selenehyun/nook/releases/download/v#{version}/Nook-#{version}.dmg"
  name "Nook"
  desc "Native RSS reader that keeps your feeds in a plain folder"
  homepage "https://github.com/selenehyun/nook"

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
      HOMEBREW_CASK_OPTS="--no-quarantine" brew install --cask selenehyun/tap/nook
  CAVEAT
end
