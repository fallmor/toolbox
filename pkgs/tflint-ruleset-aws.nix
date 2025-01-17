{ buildGoModule
, fetchFromGitHub
, lib
, source
, pkgs
}:

buildGoModule rec {
  pname = "tflint-ruleset-aws";
  version = source.version;

  src = fetchFromGitHub {
    owner = source.owner;
    repo = source.repo;
    rev = "v${version}";
    sha256 = source.sha256;
  };

  vendorSha256 = source.vendorSha256;

  # Integration test with tflint not working
  doCheck = false;

  meta = with lib; {
    description = "TFLint ruleset for terraform-provider-aws";
    homepage = "https://github.com/terraform-linters/tflint-ruleset-aws";
    license = licenses.asl20;
    maintainers = [ "xmaillard" ];
  };
}

