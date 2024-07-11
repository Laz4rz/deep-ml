## 1. Matrix times vector (easy)

Simple dot product of matrix and a vector.

Sufficient condition for the dot product to exist for these two is if the their inner dimensions match, by inner I mean (and it is how I always remembered it) $b$ and $c$ in the dimensions notation $[a, b] /time [c, d]$. Knowing this and how matrix multiplication works in general, we can implement a naive version.

```python 
def matrix_dot_vector(a:list[list[int|float]],b:list[int|float])-> list[int|float]:
    a_shape = (len(a[0]), len(a))
    b_shape = len(b)
    if a_shape[0] != b_shape: 
      return -1
    else:
      vec = []
      for i in range(a_shape[0]):
        acc = 0
        for j in range(a_shape[1]):
          acc += a[i][j] * b[j]
        vec.append(acc)
    return vec
```

Or in Zig. (why? because I can!, tbh i didnt know if i can so i wrote it)

```zig
t std = @import("std");

pub fn main() void{
        // each inner array represents a row
        // array shape is defined as { row, column}
        // this is not beautiful
	// it is not even nice
	// it works tho
	// dunno how to pass slices to functions
	// so kept it all in constant size in main
	const a = [2][2]u32{
                [2]u32{ 1, 2 },
                [2]u32{ 3, 4 },
        };

        const b = [2]u32{ 1, 2 };

        std.debug.print("a={any}\n", .{a});
        std.debug.print("b={any}\n", .{b});

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
```
