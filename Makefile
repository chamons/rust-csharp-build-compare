Q=$(if $(V),,@)

all:: rust xamarin netcore

rust::
	$(Q) echo Starting Rust Build:
	$(Q) time cargo build --manifest-path=rust/Cargo.toml -q
	$(Q) echo Starting Tests:
	$(Q) time cargo test --manifest-path=rust/Cargo.toml -q

xamarin::
	$(Q) echo Starting xamarin Build:
	$(Q) time nuget restore csharp-xamarin/csharp-xamarin.sln
	$(Q) time msbuild csharp-xamarin/csharp-xamarin.sln /v:q /nologo
	$(Q) echo Starting Tests:
	$(Q) time mono ./csharp-xamarin/packages/NUnit.ConsoleRunner.3.10.0/tools/nunit3-console.exe --noheader  csharp-xamarin/test/bin/Debug/test.dll

netcore::
	$(Q) echo Starting netcore Build:
	$(Q) time dotnet build --no-restore csharp-core/csharp-core.sln /v:q /nologo
	$(Q) echo Starting Tests:
	$(Q) time dotnet test csharp-core/test/test.csproj /v:q /nologo

clean::
	$(Q) cargo clean --manifest-path=rust/Cargo.toml -q
	$(Q) msbuild /t:Clean csharp-xamarin/csharp-xamarin.sln 
	$(Q) dotnet clean csharp-core/csharp-core.sln /v:q /nologo
