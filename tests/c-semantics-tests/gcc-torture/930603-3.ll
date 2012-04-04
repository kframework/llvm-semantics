; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930603-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i8* %b, i32 %c) nounwind uwtable {
entry:
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  %v = alloca i64, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store i64 0, i64* %v, align 8
  %0 = load i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 100, label %sw.bb
    i32 107, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i8** %b.addr, align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv = zext i8 %2 to i64
  %shl = shl i64 %conv, 8
  %3 = load i8** %b.addr, align 8
  %arrayidx1 = getelementptr inbounds i8* %3, i64 1
  %4 = load i8* %arrayidx1, align 1
  %conv2 = zext i8 %4 to i64
  %add = add i64 %shl, %conv2
  store i64 %add, i64* %v, align 8
  %5 = load i64* %v, align 8
  %shr = lshr i64 %5, 9
  store i64 %shr, i64* %v, align 8
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %6 = load i8** %b.addr, align 8
  %arrayidx4 = getelementptr inbounds i8* %6, i64 3
  %7 = load i8* %arrayidx4, align 1
  %conv5 = zext i8 %7 to i32
  %shr6 = ashr i32 %conv5, 4
  %conv7 = sext i32 %shr6 to i64
  store i64 %conv7, i64* %v, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb
  %8 = load i64* %v, align 8
  %conv8 = trunc i64 %8 to i32
  ret i32 %conv8
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [4 x i8], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 0
  store i8 -86, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 1
  store i8 5, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [4 x i8]* %buf, i32 0, i32 0
  %call = call i32 (...)* bitcast (i32 (i8*, i32)* @f to i32 (...)*)(i8* %arraydecay, i32 100)
  %cmp = icmp ne i32 %call, 85
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
