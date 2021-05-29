{ stdenv, lib, fetchurl, lzlib }:

stdenv.mkDerivation rec {
  pname = "plzip";
  version = "1.8";

  src = fetchurl {
    url = "mirror://savannah/lzip/plzip/${pname}-${version}.tar.gz";
    sha256 = "04indil809qgfmz776imb3dnhkysh7zk28jcv3mw0ahl2lyaxbzd";
  };

  buildInputs = [ lzlib ];

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://www.nongnu.org/lzip/plzip.html";
    description = "Plzip is a massively parallel (multi-threaded) implementation of lzip, fully compatible with lzip 1.4 or newer. Plzip uses the lzlib compression library.";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
