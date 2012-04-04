; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021120-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g1 = common global i32 0, align 4
@g2 = common global i32 0, align 4

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 793, i32* %y, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 793, i32* %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32* %y, align 4
  %div = sdiv i32 7930, %1
  store i32 %div, i32* @g1, align 4
  %2 = load i32* %x.addr, align 4
  %div1 = sdiv i32 7930, %2
  store i32 %div1, i32* @g2, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 793)
  %0 = load i32* @g1, align 4
  %cmp = icmp ne i32 %0, 10
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* @g2, align 4
  %cmp1 = icmp ne i32 %1, 10
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
