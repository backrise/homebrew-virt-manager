class OsinfoDb < Formula
  desc "Libosinfo database files"
  homepage "https://libosinfo.org/"
  url "https://backrise.github.io/homebrew-virt-manager/packages/libosinfo/osinfo-db-20210426.tar.xz"
  sha256 "66c93b4a5b319b2ff7d40360d9e94486a9a45f2c0dd1c30d4b31de4f223070d0"

  depends_on "osinfo-db-tools" => :build

  def install
    system "osinfo-db-import", "--local", cached_download

    # Copy the archive into the prefix to avoid empty installation error
    cp_r "./", prefix
  end

  test do
    system "osinfo-db-validate", "--local"
  end
end
