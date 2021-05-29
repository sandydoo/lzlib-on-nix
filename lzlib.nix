{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "lzlib";
  version = "1.11";

  src = fetchurl {
    url = "mirror://savannah/lzip/lzlib/${pname}-${version}.tar.gz";
    sha256 = "6c5c5f8759d1ab7c4c3c53788ea2d9daad04aeddcf338226893f8ff134914d36";
  };

  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://www.nongnu.org/lzip/lzlib.html";
    description = "A data compression library providing in-memory LZMA compression and decompression functions, including integrity checking of the decompressed data";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
