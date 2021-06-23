{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "lzlib";
  version = "1.12";

  src = fetchurl {
    url = "mirror://savannah/lzip/lzlib/${pname}-${version}.tar.gz";
    sha256 = "1c9pwd6by8is4z8bs6j306jyy6pgm2dvsn4fr7fg2b5m5qj88pcf";
  };

  configureFlags = [
    "CPPFLAGS=-DNDEBUG"
    "CFLAGS=-O3"
    "CXXFLAGS=-O3"
  ] ++ lib.optional (stdenv.hostPlatform != stdenv.buildPlatform)
    "CXX=${stdenv.cc.targetPrefix}c++";

  doCheck = true;
  enableParallelBuilding = true;

  meta = with lib; {
    homepage = "https://www.nongnu.org/lzip/lzlib.html";
    description = "A data compression library providing in-memory LZMA compression and decompression functions, including integrity checking of the decompressed data";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
