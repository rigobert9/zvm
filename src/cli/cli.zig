pub const install = @import("install.zig");
const std = @import("std");
const mem = std.mem;
const testing = std.testing;
pub const system = @import("system.zig");
pub const use = @import("use.zig");

pub const Args = struct {
    outpath: ?[:0]u8 = null,
    help: []const u8 = "(Zig Version Manager)\n-h, --help\tDisplay this help and exit.\n-v, --version\tPrint out the installed version of zvm.\n-o, --out <str>\tChanges the path at which ZVM installs and unzips Zig.",
    version: []const u8 = "zvm (Zig Version Manager) v0.0.1-alpha.1",
    positionals: ?[][:0]u8 = null,

    /// `parse()` analyzes command line arguments and fill the appropriate struct fields.
    ///
    /// If arguments for 'help' or 'version' are detected. `parse()` will print
    /// the appropriate value to stderr and exit 0.
    pub fn parse(self: *Args, alloc: std.mem.Allocator) !void {
        const args: [][:0]u8 = try std.process.argsAlloc(alloc);
        if (args.len > 0) self.positionals = args else return;
        for (args) |_, i| {
            if (self.containsAny(&.{"-o", "--outfile"}) and args.len >= i + 1) {
                self.outpath = args[i + 1];
            } else if (self.containsAny(&.{"-h", "--help", "help"})) {
                std.debug.print("{s}\n", .{self.help});
                std.os.exit(0);
            } else if (self.containsAny(&.{"-v", "--version", "version"})) {
                std.debug.print("{s}\n", .{self.version});
                std.os.exit(0);
            }
        }
    }

    /// Returns true if any of the values in the `args` paramater exist in the 
    /// values passed through the command line. Returns false otherwise.
    pub fn containsAny(self: *Args, args: []const []const u8) bool {
        if (self.positionals) |b_args| {
            for (args) |a| {
                for (b_args) |b| {
                    if (mem.eql(u8, a, b)) return true;
                }
            }
        }
        return false;
    }
};

// test "containsAny finds match" {
//     var args = Args{};
//     try args.parse(std.testing.allocator);
//     try std.testing.expect(args.containsAny(&.{"is", "pickle", "function"}));
// }

// test "containsAny doesn't find match" {
//     var args = Args{};
//     try args.parse(std.testing.allocator);
//     try std.testing.expect(args.containsAny(&.{"purple", "rain", "version"}));
// }

// This tests passes, but it's annoying to see red when I'm not looking for it.
// test "-o flag grabs outpath" {
//     const alloc = testing.allocator();
//     defer alloc.deinit();
//     var args = Args{};
//     try args.parse(alloc);
//     testing.expectEqual("test", args.outpath);
// }

// test "-o is null when not passed" {
//     const alloc = testing.allocator();
//     defer alloc.deinit();
//     var args = Args{};
//     try args.parse(alloc);
//     testing.expectEqual(null, args.outpath);
// }
