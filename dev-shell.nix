{ mkShell, openssl, pkg-config, rust-toolchain_stable }:

mkShell {
  buildInputs = [ openssl pkg-config rust-toolchain_stable ];
}
