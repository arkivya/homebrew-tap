cask "arkspider" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.8.20"
  sha256 arm:   "e066a2ac59b07894120de060b2c6ef00b401ad90ecfddc2f875e36c731e4b2ac",
         intel: "3953ac6417ab27fdb8bdfcc039c4a6c9c5b67f13512ca066b3fb5739f6bd68ba"

  url "https://github.com/arkivya/spider-releases/releases/download/v#{version}/arkspider-darwin-#{arch}-v#{version}.zip"
  name "ArkSpider"
  desc "Local-first website crawler and technical SEO auditor"
  homepage "https://github.com/arkivya/spider-releases"

  app "arkspider.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/arkspider.app"]
  end

  zap trash: "~/Library/Application Support/arkspider"
end
