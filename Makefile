rust::
	@echo Starting Build:
	@time cargo build --manifest-path=rust/Cargo.toml -q
	@echo Starting Tests:
	@time cargo test --manifest-path=rust/Cargo.toml -q

xamarin::
	@echo Starting Build:
	@time msbuild csharp-xamarin/csharp-xamarin.sln /v:q /nologo
	@echo Starting Tests:
	@time mono ./csharp-xamarin/packages/NUnit.ConsoleRunner.3.10.0/tools/nunit3-console.exe --noheader  csharp-xamarin/test/bin/Debug/test.dll

clean::
	@cargo clean --manifest-path=rust/Cargo.toml -q
	@msbuild /t:Clean csharp-xamarin/csharp-xamarin.sln 
