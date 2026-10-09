class Rootform < Formula
  desc "Architecture compiler and policy CLI"
  homepage "https://rootform.dev"
  version "0.2.0"
  license "Elastic-2.0"

  depends_on macos: :monterey

  on_arm do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.2.0/rootform_#{version}_darwin_arm64.tar.gz"
    sha256 "766ee9b96166cba95ec6ed2d9812d3aa58cb436460633b4f6c95b7b5d8eaceb4"
  end

  on_intel do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.2.0/rootform_#{version}_darwin_amd64.tar.gz"
    sha256 "a484535a9f00ad19c75d58ef60eeaeba5c9bb518e8d701fb7b3babda14e34e4b"
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
