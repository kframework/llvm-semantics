; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990106-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i8* %bufp) nounwind uwtable {
entry:
  %bufp.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  store i8* %bufp, i8** %bufp.addr, align 8
  store i32 80, i32* %x, align 4
  %0 = load i32* %x, align 4
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 97, i32 98
  %conv = trunc i32 %cond to i8
  %1 = load i8** %bufp.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %bufp.addr, align 8
  store i8 %conv, i8* %1, align 1
  %conv1 = sext i8 %conv to i32
  ret i32 %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i8*)* @foo to i32 (...)*)(i8* %x)
  %cmp = icmp ne i32 %call, 97
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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
