# Prebuilt Homebrew formula for ccbar v2.0.0 (Claude Code info bar).
# Regenerate per release (or let .goreleaser.yaml's brews: block maintain it).
class Ccbar < Formula
  desc "Claude Code status-line info bar: tokens, cost, limits, burn rate, spend"
  homepage "https://github.com/sayginsaman/ccbar"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sayginsaman/ccbar/releases/download/v2.0.0/ccbar_darwin_arm64.tar.gz"
      sha256 "5203f1accb1e6ced50e062b8b69c17bfdd3c2764c23b367d073e9a4e580598c9"
    else
      url "https://github.com/sayginsaman/ccbar/releases/download/v2.0.0/ccbar_darwin_amd64.tar.gz"
      sha256 "e415f693c0174005b368bfe56a881fbe60c1c0bc51281c464701268269dc4e3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sayginsaman/ccbar/releases/download/v2.0.0/ccbar_linux_arm64.tar.gz"
      sha256 "efb30b14195b3bdd5fcee38a20f097f895a967320f706aecf3c01a1939c7aa4b"
    else
      url "https://github.com/sayginsaman/ccbar/releases/download/v2.0.0/ccbar_linux_amd64.tar.gz"
      sha256 "b297f24f8cf51e08cf5de64dd11a5110585c47aafa726c6cf2a6f539b719ce65"
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
