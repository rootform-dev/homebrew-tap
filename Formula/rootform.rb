class Rootform < Formula
  desc "Architecture compiler and policy CLI"
  homepage "https://rootform.dev"
  version "0.3.0"
  license "Elastic-2.0"

  depends_on macos: :monterey

  on_arm do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.3.0/rootform_#{version}_darwin_arm64.tar.gz"
    sha256 "2e59aee21d8660cf7a7fb55b229543961aad3bfa79fdbe194e4036f38eb97153"
  end

  on_intel do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.3.0/rootform_#{version}_darwin_amd64.tar.gz"
    sha256 "b82b1c703d177f0e05cd631fad7ada44f4fabed168658a5a02a4e5de04051f15"
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
