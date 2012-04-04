; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921123-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i16* %p) nounwind uwtable {
entry:
  %p.addr = alloca i16*, align 8
  %x = alloca i16, align 2
  store i16* %p, i16** %p.addr, align 8
  %0 = load i16** %p.addr, align 8
  %1 = load i16* %0, align 2
  store i16 %1, i16* %x, align 2
  %2 = load i16* %x, align 2
  %dec = add i16 %2, -1
  store i16 %dec, i16* %x, align 2
  %conv = sext i16 %dec to i32
  %cmp = icmp slt i32 %conv, 0
  %conv1 = zext i1 %cmp to i32
  ret i32 %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i16, align 2
  store i32 0, i32* %retval
  store i16 -10, i16* %x, align 2
  %call = call i32 @f(i16* %x)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

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
