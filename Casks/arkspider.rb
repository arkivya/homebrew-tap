cask "arkspider" do
  arch arm: "arm64", intel: "x86_64"

  version "1.26.823"
  sha256 arm:   "317ac3f4e46391e9fe7390c844297d6c5d9bf51773eff9730f6f7beeca25b093",
         intel: "61e4a7c1e1d9b991a914dd482e09a5da026c22c4d34aeb8f1c3f1059be648391"

  url "https://github.com/arkivya/spider-releases/releases/download/v#{version}/arkspider-darwin-#{arch}-v1.26.8.23.zip"
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
