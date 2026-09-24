class Rootform < Formula
  desc "Architecture compiler and policy CLI"
  homepage "https://rootform.dev"
  version "0.1.1"
  license "Elastic-2.0"

  depends_on macos: :monterey

  on_arm do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.1.1/rootform_#{version}_darwin_arm64.tar.gz"
    sha256 "7034c6528ae9c6588c2c0f8effd4d60e27e36a6c334ecd13eff5ecc9613ef2f6"
  end

  on_intel do
    url "https://github.com/rootform-dev/rootform/releases/download/v0.1.1/rootform_#{version}_darwin_amd64.tar.gz"
    sha256 "7aeb12dd2942a53aba89f1a9c75e5d8817846678de399be4f6d1ae7d815017da"
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
