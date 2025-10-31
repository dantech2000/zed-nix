# Example Nix file for testing syntax highlighting and LSP features

{ pkgs ? import <nixpkgs> {} }:

let
  # Define some variables
  name = "hello-world";
  version = "1.0.0";
  
  # A simple function
  greet = person: "Hello, ${person}!";
  
  # List comprehension
  numbers = [ 1 2 3 4 5 ];
  doubled = map (x: x * 2) numbers;
  
  # Attribute set
  config = {
    enable = true;
    port = 8080;
    host = "localhost";
  };
  
in
pkgs.stdenv.mkDerivation {
  pname = name;
  inherit version;
  
  src = pkgs.fetchFromGitHub {
    owner = "example";
    repo = name;
    rev = "v${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };
  
  buildInputs = with pkgs; [
    gcc
    cmake
    pkg-config
  ];
  
  configurePhase = ''
    echo "Configuring..."
    echo ${greet "Nix"}
  '';
  
  buildPhase = ''
    echo "Building..."
    make -j$NIX_BUILD_CORES
  '';
  
  installPhase = ''
    mkdir -p $out/bin
    cp result $out/bin/${name}
  '';
  
  meta = with pkgs.lib; {
    description = "A hello world example";
    homepage = "https://example.com";
    license = licenses.mit;
    maintainers = [ maintainers.example ];
    platforms = platforms.unix;
  };
}

