; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20070424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @do_exit() nounwind uwtable {
entry:
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @exit(i32) noreturn

define void @do_abort() nounwind uwtable {
entry:
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn

define void @foo(i32 %x, i32 %a) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 %a, i32* %a.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %tmp1 = load i32* %a.addr, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %doit

if.end:                                           ; preds = %entry
  call void @do_exit()
  %tmp2 = load i32* %x.addr, align 4
  %tmp3 = load i32* %a.addr, align 4
  %cmp4 = icmp ne i32 %tmp2, %tmp3
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  br label %doit

if.end6:                                          ; preds = %if.end
  call void @do_abort()
  br label %return

doit:                                             ; preds = %if.then5, %if.then
  call void @do_abort()
  br label %return

return:                                           ; preds = %doit, %if.end6
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1, i32 0)
  ret i32 0
}
