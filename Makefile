


all: test nuget

test: tests/bin/Debug/SQLite.Tests.dll
	nunit-console tests/bin/Debug/SQLite.Tests.dll

tests/bin/Debug/SQLite.Tests.dll: tests/SQLite.Tests.csproj src/SQLite.cs src/SQLiteAsync.cs
	xbuild tests/SQLite.Tests.csproj

nuget: srcnuget pclnuget

srcnuget: src/SQLite.cs src/SQLiteAsync.cs sqlite-net-ecp.nuspec
	nuget pack sqlite-net-ecp.nuspec

pclnuget: src/SQLite.cs src/SQLiteAsync.cs
	nuget restore SQLiteECP.sln
	'/Applications/Xamarin Studio.app/Contents/MacOS/mdtool' build '-c:Release|iPhone' SQLiteECP.sln -p:SQLite-net-ecp
	nuget pack sqlite-net-pcl-ecp.nuspec -o .\

