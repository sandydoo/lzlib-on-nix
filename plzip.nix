{ stdenv, lib, fetchurl, lzlib }:

stdenv.mkDerivation rec {
  pname = "plzip";
  version = "1.9";

  src = fetchurl {
    url = "mirror://savannah/lzip/plzip/${pname}-${version}.tar.gz";
    sha256 = "19zinpx7hssl6r3vilpvq2s7wha3545xan8b0vcvsxnyipdx3n0l";
  };

  buildInputs = [ lzlib ];

  doCheck = true;
  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://www.nongnu.org/lzip/plzip.html";
    description = "A massively parallel (multi-threaded) implementation of lzip";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
