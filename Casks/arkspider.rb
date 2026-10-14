cask "arkspider" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.4"
  sha256 arm:   "845768daefdb623547081633dc1960c1895c163e1cff4ae2abe572eb3db671d3",
         intel: "efdd102762fb3071e749380a8eb63d22b029b84121350798de3ad9766df1aabc"

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
