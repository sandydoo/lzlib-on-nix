let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) stdenv lib fetchurl;

  lzlib = stdenv.mkDerivation rec {
    pname = "lzlib";
    version = "1.11";

    src = fetchurl {
      url = "mirror://savannah/lzip/lzlib/${pname}-${version}.tar.gz";
      sha256 = "6c5c5f8759d1ab7c4c3c53788ea2d9daad04aeddcf338226893f8ff134914d36";
    };

    configureFlags = [
      "CPPFLAGS=-DNDEBUG"
      "CFLAGS=-O3"
      "CXXFLAGS=-O3"
    ] ++ stdenv.lib.optional (stdenv.hostPlatform != stdenv.buildPlatform)
      "CXX=${stdenv.cc.targetPrefix}c++";

    enableParallelBuilding = true;

    meta = with lib; {
      homepage = "https://www.nongnu.org/lzip/lzlib.html";
      description = "Lzlib is a data compression library providing in-memory LZMA compression and decompression functions, including integrity checking of the decompressed data.";
      license = licenses.gpl3Plus;
      platforms = platforms.all;
    };
  };

  plzip = stdenv.mkDerivation rec {
    pname = "plzip";
    version = "1.8";

    src = fetchurl {
      url = "mirror://savannah/lzip/plzip/${pname}-${version}.tar.gz";
      sha256 = "04indil809qgfmz776imb3dnhkysh7zk28jcv3mw0ahl2lyaxbzd";
    };

    buildInputs = [ lzlib ];

    configureFlags = [
      "CPPFLAGS=-DNDEBUG"
      "CFLAGS=-O3"
      "CXXFLAGS=-O3"
    ] ++ lib.optional (stdenv.hostPlatform != stdenv.buildPlatform)
      "CXX=${stdenv.cc.targetPrefix}c++";

    enableParallelBuilding = true;

    meta = with lib; {
      homepage = "https://www.nongnu.org/lzip/plzip.html";
      description = "Plzip is a massively parallel (multi-threaded) implementation of lzip, fully compatible with lzip 1.4 or newer. Plzip uses the lzlib compression library.";
      license = licenses.gpl3Plus;
      platforms = platforms.all;
    };
  };

in plzip
