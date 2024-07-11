const std = @import("std");

pub fn main() void{
	// each inner array represents a row
	// array shape is defined as { row, column}
	const a = [2][2]u32{
  		[2]u32{ 1, 2 },
  		[2]u32{ 3, 4 },
	};

	const b = [2]u32{ 1, 2 };
//	const c: []u32 = undefined;
	
	std.debug.print("a={any}\n", .{a});
	std.debug.print("b={any}\n", .{b});
//	std.debug.print("c={any}\n", .{c});

//	matrix_times_vector(&a, &b);

	
	const shape_a = [2]usize{ a[0].len, a.len };
	const shape_b: usize = b.len;

	std.debug.print("a shape is: {any}\n", .{shape_a});
	std.debug.print("b shape is: {}\n", .{shape_b});

	if (shape_a[1] == shape_b) {
		var res = [2]u32{ 0, 0 };
		for (0..shape_a[0]) |i| {
			for (0..shape_a[1]) |j| {
				res[i] += a[i][j] * b[j];
				std.debug.print("      i={}, j={}, a_ij={}, b_j={}, res_i={}\n", .{i, j, a[i][j], b[j], res[i]});
			}
		}
		std.debug.print("res={any}\n", .{res});
	}
	else {
		std.debug.print("Inner dimensions mismatch", .{});
	}
}

//fn matrix_times_vector(a: *const [][]u32, b: *const []u32) void {
//	std.debug.print("Inside fn: \n", .{});
//	std.debug.print("a={any}\n", .{a.*});
//	std.debug.print("b={any}\n", .{b.*});
//	std.debug.print("c={any}\n", .{c.*});
//	
//	const shape_a = [2]u32{ a.*[0].len, a.*.len };
//	const shape_b = b.*.len;
//	
//	std.debug.print("a shape is: {any}", .{shape_a});
//	std.debug.print("b shape is: {}", .{shape_b});
//
//	
//}
