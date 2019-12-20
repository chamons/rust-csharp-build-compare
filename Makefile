rust:: clean
	@echo Starting Build:
	@time cargo build --manifest-path=rust/Cargo.toml -q
	@echo Starting Tests:
	@time cargo test --manifest-path=rust/Cargo.toml -q

clean::
	@cargo clean --manifest-path=rust/Cargo.toml	-q