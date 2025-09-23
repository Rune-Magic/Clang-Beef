using System;
using System.Interop;

namespace LibClang;

static
{
	[Comptime(ConstEval=true)]
	public static StringView CINDEX_VERSION_STRINGIZE(c_int major, c_int minor) => scope $"{major}.{minor}";

	[Comptime(ConstEval=true)]
	public static c_int CINDEX_VERSION_ENCODE(c_int major, c_int minor) => (((major) * 10000) + ((minor) * 1));
}

static class Clang
{
	protected const let dll = "libclang" +
#if BF_PLATFORM_WINDOWS
		".dll";
#elif BF_PLATFORM_MACOS
		".dylib";
#else
		".so";
#endif

	protected typealias time_t = uint32;
}
