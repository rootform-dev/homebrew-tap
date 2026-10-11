class Rootform < Formula
  desc "Architecture compiler and policy CLI"
  homepage "https://rootform.dev"
  version "0.2.1"
  license "Elastic-2.0"

  depends_on macos: :monterey

  on_arm do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.2.1/rootform_#{version}_darwin_arm64.tar.gz"
    sha256 "2fc567e70e06b75a1b0d4f916fe8148f0bf5f0d37f447e24749535ca3dc3546e"
  end

  on_intel do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.2.1/rootform_#{version}_darwin_amd64.tar.gz"
    sha256 "4f6689664c55813e870f4dd3a92e35d7337a79039e9035c762bc8171e9a7d3d7"
  end

  def install
    bin.install "rootform"
    pkgshare.install "ROOTFORM-BINARY-LICENSE.txt"
    pkgshare.install "THIRD_PARTY_NOTICES.txt"
    pkgshare.install "rootform_#{version}_sbom.spdx.json"
    pkgshare.install "SHA256SUMS"
  end

  test do
    assert_match "rootform #{version}", shell_output("#{bin}/rootform version")
  end
end
