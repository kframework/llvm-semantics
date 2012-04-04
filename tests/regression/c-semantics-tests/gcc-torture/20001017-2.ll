; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001017-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @fn_4parms(i8 zeroext %a, i64* %b, i64* %c, i32* %d) nounwind uwtable {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i64*, align 8
  %c.addr = alloca i64*, align 8
  %d.addr = alloca i32*, align 8
  store i8 %a, i8* %a.addr, align 1
  store i64* %b, i64** %b.addr, align 8
  store i64* %c, i64** %c.addr, align 8
  store i32* %d, i32** %d.addr, align 8
  %0 = load i64** %b.addr, align 8
  %1 = load i64* %0, align 8
  %cmp = icmp ne i64 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i64** %c.addr, align 8
  %3 = load i64* %2, align 8
  %cmp1 = icmp ne i64 %3, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load i32** %d.addr, align 8
  %5 = load i32* %4, align 4
  %cmp3 = icmp ne i32 %5, 3
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i64, align 8
  %c = alloca i64, align 8
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 0, i8* %a, align 1
  store i64 1, i64* %b, align 8
  store i64 2, i64* %c, align 8
  store i32 3, i32* %d, align 4
  %0 = load i8* %a, align 1
  call void @fn_4parms(i8 zeroext %0, i64* %b, i64* %c, i32* %d)
  ret i32 0
}
