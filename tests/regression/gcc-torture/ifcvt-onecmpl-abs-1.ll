; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ifcvt-onecmpl-abs-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %n) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp1 = load i32* %n.addr, align 4
  %neg = xor i32 %tmp1, -1
  store i32 %neg, i32* %n.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp2 = load i32* %n.addr, align 4
  ret i32 %tmp2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 -1)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
