cask "arkspider" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.3"
  sha256 arm:   "7af245f8c29800c11626751bbe8ec09f0814ca7f8125eba607b3472182e4892f",
         intel: "62f519eb8c27cd70b03c43cbda547283a6d2d78f984a5e3654f63c3cb6620bbd"

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
