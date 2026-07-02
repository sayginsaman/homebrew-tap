# Prebuilt Homebrew formula for ccbar v1.1.0 (Claude Code info bar).
# Regenerate per release (or let .goreleaser.yaml's brews: block maintain it).
class Ccbar < Formula
  desc "Claude Code status-line info bar: tokens, cost, session/weekly/per-model limits"
  homepage "https://github.com/sayginsaman/ccbar"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sayginsaman/ccbar/releases/download/v1.1.0/ccbar_darwin_arm64.tar.gz"
      sha256 "71d7714ccb72c09d630080ad03ab0f419c43b335df1684c16dca0b09ec208971"
    else
      url "https://github.com/sayginsaman/ccbar/releases/download/v1.1.0/ccbar_darwin_amd64.tar.gz"
      sha256 "2a28dbc99a13d431db79a32c00f824f68027b1e5ed2b7ed56565ffd26ec107f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sayginsaman/ccbar/releases/download/v1.1.0/ccbar_linux_arm64.tar.gz"
      sha256 "3d3467b4efc0d06a60179a776651de02cb68f182520265ac10dd14a2dedef3fb"
    else
      url "https://github.com/sayginsaman/ccbar/releases/download/v1.1.0/ccbar_linux_amd64.tar.gz"
      sha256 "2308f647e165c7aa4f8773cbad094b2717a6b2e32725609ecc41b9dc2f28f4cc"
    end
  end

  def install
    bin.install "ccbar"
  end

  def caveats
    <<~EOS
      Activate the status line (edits ~/.claude/settings.json, with a backup):
        ccbar install
      Remove with:
        ccbar uninstall      # then: brew uninstall ccbar
    EOS
  end

  test do
    assert_match "ccbar", shell_output("#{bin}/ccbar --version")
  end
end
