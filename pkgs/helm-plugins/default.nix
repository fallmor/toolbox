{ sources
, pkgs
, fetchpatch
}:

{

  diff = let
    source = sources.helm-diff;
  in pkgs.buildGoModule rec {
    pname = "helm-diff";
    version = source.version;
    src = pkgs.fetchFromGitHub {
      owner = source.owner;
      repo = source.repo;
      rev = "v${version}";
      sha256 = source.sha256;
    };
    vendorSha256 = source.vendorSha256;
    postInstall = ''
      mv $out/bin/helm-diff $out/bin/diff
    '';
  };

}
