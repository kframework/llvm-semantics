; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20466-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32** %ipp, i32* nocapture %i1p, i32* %i2p, i32** %i3, i32** %i4) nounwind uwtable noinline {
entry:
  %tmp1 = load i32* %i1p, align 4
  %tmp3 = load i32** %ipp, align 8
  store i32 %tmp1, i32* %tmp3, align 4
  store i32* %i2p, i32** %ipp, align 8
  %tmp7 = load i32** %i4, align 8
  store i32* %tmp7, i32** %i3, align 8
  %tmp10 = load i32** %ipp, align 8
  store i32 99, i32* %tmp10, align 4
  ret i32 3
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %ip = alloca i32*, align 8
  %i3p = alloca i32*, align 8
  %i4p = alloca i32*, align 8
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
  %cmp = icmp eq i32 %tmp, 66
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32** %ip, align 8
  %cmp2 = icmp eq i32* %tmp1, %i2
  %tmp4 = load i32* %i2, align 4
  %cmp5 = icmp eq i32 %tmp4, 99
  %or.cond = and i1 %cmp2, %cmp5
  br i1 %or.cond, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %tmp7 = load i32* %i3, align 4
  %cmp8 = icmp eq i32 %tmp7, -1
  br i1 %cmp8, label %lor.lhs.false9, label %if.then

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32** %i3p, align 8
  %tmp11 = load i32** %i4p, align 8
  %cmp12 = icmp eq i32* %tmp10, %tmp11
  br i1 %cmp12, label %lor.lhs.false13, label %if.then

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %tmp14 = load i32* %i4, align 4
  %cmp15 = icmp eq i32 %tmp14, 55
  br i1 %cmp15, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false13, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false13
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
