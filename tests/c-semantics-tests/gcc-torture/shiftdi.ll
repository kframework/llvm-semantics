; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/shiftdi.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @g(i64 %x, i32 %y, i32 %z, i64* %p) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  %p.addr = alloca i64*, align 8
  %w = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  store i64* %p, i64** %p.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i32* %y.addr, align 4
  %sh_prom = zext i32 %1 to i64
  %shr = lshr i64 %0, %sh_prom
  %and = and i64 %shr, 4294967295
  %2 = load i32* %z.addr, align 4
  %and1 = and i32 %2, 31
  %sh_prom2 = zext i32 %and1 to i64
  %shl = shl i64 %and, %sh_prom2
  %conv = trunc i64 %shl to i32
  store i32 %conv, i32* %w, align 4
  %3 = load i32* %w, align 4
  %conv3 = zext i32 %3 to i64
  %and4 = and i64 %conv3, 4294967295
  %4 = load i32* %z.addr, align 4
  %sh_prom5 = zext i32 %4 to i64
  %shl6 = shl i64 %and4, %sh_prom5
  %5 = load i64** %p.addr, align 8
  %6 = load i64* %5, align 8
  %or = or i64 %6, %shl6
  store i64 %or, i64* %5, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 0, i64* %a, align 8
  call void @g(i64 -2401053092593056409, i32 0, i32 0, i64* %a)
  %0 = load i64* %a, align 8
  %cmp = icmp eq i64 %0, 19088743
  %cond = select i1 %cmp, i32 0, i32 1
  ret i32 %cond
}
