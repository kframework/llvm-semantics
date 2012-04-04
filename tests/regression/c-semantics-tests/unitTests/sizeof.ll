; ModuleID = '/home/david/src/c-semantics/tests/unitTests/sizeof.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s0 = type { i8*, i8, i16, i32, i64, i64 }
%struct.s1 = type { [5 x i8], %struct.s0, [5 x %struct.s0], %struct.s0* }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tchar = alloca i8, align 1
  %tuchar = alloca i8, align 1
  %tschar = alloca i8, align 1
  %tsint = alloca i16, align 2
  %tusint = alloca i16, align 2
  %tint = alloca i32, align 4
  %tuint = alloca i32, align 4
  %tlint = alloca i64, align 8
  %tulint = alloca i64, align 8
  %tllint = alloca i64, align 8
  %tullint = alloca i64, align 8
  %tpint = alloca i32*, align 8
  %x = alloca [15 x i8], align 1
  %y = alloca [15 x i32], align 16
  %w = alloca [5 x [4 x [3 x i32]]], align 16
  %mys0 = alloca %struct.s0, align 8
  %mys1 = alloca %struct.s1, align 8
  %mys1b = alloca [7 x %struct.s1], align 16
  store i32 0, i32* %retval
  ret i32 0
}
