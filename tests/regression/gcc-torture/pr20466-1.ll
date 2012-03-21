; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20466-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32** %ipp, i32* %i1p, i32* %i2p, i32** %i3, i32** %i4) nounwind uwtable noinline {
entry:
  %ipp.addr = alloca i32**, align 8
  %i1p.addr = alloca i32*, align 8
  %i2p.addr = alloca i32*, align 8
  %i3.addr = alloca i32**, align 8
  %i4.addr = alloca i32**, align 8
  store i32** %ipp, i32*** %ipp.addr, align 8
  store i32* %i1p, i32** %i1p.addr, align 8
  store i32* %i2p, i32** %i2p.addr, align 8
  store i32** %i3, i32*** %i3.addr, align 8
  store i32** %i4, i32*** %i4.addr, align 8
  %tmp = load i32** %i1p.addr, align 8
  %tmp1 = load i32* %tmp
  %tmp2 = load i32*** %ipp.addr, align 8
  %tmp3 = load i32** %tmp2
  store i32 %tmp1, i32* %tmp3
  %tmp4 = load i32** %i2p.addr, align 8
  %tmp5 = load i32*** %ipp.addr, align 8
  store i32* %tmp4, i32** %tmp5
  %tmp6 = load i32*** %i4.addr, align 8
  %tmp7 = load i32** %tmp6
  %tmp8 = load i32*** %i3.addr, align 8
  store i32* %tmp7, i32** %tmp8
  %tmp9 = load i32*** %ipp.addr, align 8
  %tmp10 = load i32** %tmp9
  store i32 99, i32* %tmp10
  ret i32 3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %ip = alloca i32*, align 8
  %i3p = alloca i32*, align 8
  %i4p = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 42, i32* %i, align 4
  store i32 66, i32* %i1, align 4
  store i32 1, i32* %i2, align 4
  store i32 -1, i32* %i3, align 4
  store i32 55, i32* %i4, align 4
  store i32* %i, i32** %ip, align 8
  store i32* %i3, i32** %i3p, align 8
  store i32* %i4, i32** %i4p, align 8
  %call = call i32 @f(i32** %ip, i32* %i1, i32* %i2, i32** %i3p, i32** %i4p)
  %tmp = load i32* %i, align 4
  %cmp = icmp ne i32 %tmp, 66
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32** %ip, align 8
  %cmp2 = icmp ne i32* %tmp1, %i2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %i2, align 4
  %cmp5 = icmp ne i32 %tmp4, 99
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %i3, align 4
  %cmp8 = icmp ne i32 %tmp7, -1
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32** %i3p, align 8
  %tmp11 = load i32** %i4p, align 8
  %cmp12 = icmp ne i32* %tmp10, %tmp11
  br i1 %cmp12, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %tmp14 = load i32* %i4, align 4
  %cmp15 = icmp ne i32 %tmp14, 55
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false13, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false13
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
