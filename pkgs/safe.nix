{ stdenv
, source
, buildGoPackage
}:

buildGoPackage rec {
  name = "safe-${version}";
  version = source.rev;
  src = source.outPath;

  goPackagePath = "github.com/starkandwayne/safe";

  meta = with stdenv.lib; {
    description = "A Vault CLI";
    homepage = "https://github.com/starkandwayne/safe";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}