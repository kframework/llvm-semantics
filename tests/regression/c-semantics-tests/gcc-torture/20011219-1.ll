; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"foo\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"bar\00", align 1

define void @bar(i8* %x, i32 %y, i8* %z) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  %z.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  store i8* %z, i8** %z.addr, align 8
  ret void
}

define i64 @foo(i32 %x, i8* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %a = alloca i64, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  %0 = load i32* %x.addr, align 4
  switch i32 %0, label %sw.default [
    i32 10, label %sw.bb
    i32 11, label %sw.bb1
    i32 12, label %sw.bb2
    i32 13, label %sw.bb3
    i32 14, label %sw.bb4
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i8** %y.addr, align 8
  %2 = bitcast i8* %1 to i64*
  %3 = load i64* %2, align 8
  store i64 %3, i64* %a, align 8
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %4 = load i8** %y.addr, align 8
  %5 = bitcast i8* %4 to i64*
  %6 = load i64* %5, align 8
  store i64 %6, i64* %a, align 8
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %7 = load i8** %y.addr, align 8
  %8 = bitcast i8* %7 to i64*
  %9 = load i64* %8, align 8
  store i64 %9, i64* %a, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %10 = load i8** %y.addr, align 8
  %11 = bitcast i8* %10 to i64*
  %12 = load i64* %11, align 8
  store i64 %12, i64* %a, align 8
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %13 = load i8** %y.addr, align 8
  %14 = bitcast i8* %13 to i64*
  %15 = load i64* %14, align 8
  store i64 %15, i64* %a, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @bar(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 1, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %16 = load i64* %a, align 8
  ret i64 %16
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 24, i64* %i, align 8
  %0 = bitcast i64* %i to i8*
  %call = call i64 @foo(i32 13, i8* %0)
  %cmp = icmp ne i64 %call, 24
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
