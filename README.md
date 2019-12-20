## rust-csharp-build-compare

This is a small sample showing how quickly a tiny testable console app (exe + lib + test) can be run in:

- rust
- .NET Console app (Xamarin/mono) (.nunit3 tests)
- .NET Core Console app (xunit tests)


## Results on my machine

### First Run (fully clean repo)

This is run after a git clean -xdf so there is no cache of any kind:

```
git clean -xdf
make <- Measuring this one
```

First number is build, second number is test execution.

- Rust: 0.45, 0.50
- Xamarin: 2.86 + 1.97, 1.25
- .NET Core: 1.93, 3.02

### First Run (after simple clean)

This is a run after doing a build and then clean, so we have nugets but nothing else.

```
make
make clean
make <- Measuring this one
```

- Rust: 0.46, 0.50
- Xamarin: 2.86 + 2.00, 1.26
- .NET Core: 1.57, 3.00

### No change run

This is a run after another run, no change

```
make
make <- Measuring this one
```

- Rust: 0.02, 0.08
- Xamarin: 2.86 + 1.78, 1.25
- .NET Core: 1.32, 3.05

### Changing library line

This is a run after modifying the add method to add 3, thus causing a test failure

```
make
make code change
make rust <- Measuring this one
make xamarin <- Measuring this one
make netcore <- Measuring this one
```

- Rust: 0.33, 0.40
- Xamarin 2.65 + 1.89, 1.28
- .NET Core: 1.42, 2.99


## Optimizations

I chose safe defaults, but you could:

- Remove the nuget restore in the Xamarin case and add `--no-restore` to .NET Core if you are willing to remember to restore

This changes the timings, dropping about 2 seconds off Xamarin .4 seconds or so off net core
