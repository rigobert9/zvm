const std = @import("std");
const ArrayList = std.ArrayList;
const cli = @import("cli/cli.zig");
const string = []const u8;
const ansi = @import("ansi.zig");
const builtin = @import("builtin");

pub fn main() !void {

    // Fetching data. Where we currenlty process the cli.

    // FETCHING DATA
    var arena_state = std.heap.ArenaAllocator.init(std.heap.c_allocator);
    defer arena_state.deinit();

    var allocator = arena_state.allocator();

    var args = cli.Args{};
    try args.parse(allocator);

    if (args.positionals == null) {
        return std.debug.print("{s}", .{args.help});
    }

    if (args.positionals) |argv| {
        // Command line parser
        for (argv) |val, i| {
            if (std.mem.eql(u8, "install", val) and argv.len >= i + 1) {
                try cli.install.install(&allocator, argv[i + 1]);
            } else if (std.mem.eql(u8, "use", val) and argv.len >= i + 1) {} else if (std.mem.eql(u8, "upgrade", val) and argv.len >= i + 1) {
                std.debug.print("upgrade called\n", .{});
                std.debug.print("{s}", .{cli.system.homeDir(allocator).?});
            } else {
                std.debug.print("Invalid Zig version provided. Try master\n", .{});
                return;
            }

            return;
        }
    }
}

