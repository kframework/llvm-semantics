; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920603-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32 %got) nounwind uwtable {
entry:
  %got.addr = alloca i32, align 4
  store i32 %got, i32* %got.addr, align 4
  %0 = load i32* %got.addr, align 4
  %cmp = icmp ne i32 %0, 65535
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i8, align 1
  %u = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 -1, i8* %c, align 1
  %0 = load i8* %c, align 1
  %conv = sext i8 %0 to i16
  %conv1 = zext i16 %conv to i32
  store i32 %conv1, i32* %u, align 4
  %1 = load i32* %u, align 4
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 %1)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn
