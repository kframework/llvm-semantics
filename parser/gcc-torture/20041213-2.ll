; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041213-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  %next_n = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 1, i32* %next_n, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end16

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %next_n, align 4
  store i32 %tmp2, i32* %n, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %tmp4 = load i32* %j, align 4
  %tmp5 = load i32* %n, align 4
  %cmp6 = icmp slt i32 %tmp4, %tmp5
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond3
  %tmp8 = load i32* %next_n, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %next_n, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %tmp9 = load i32* %j, align 4
  %inc10 = add nsw i32 %tmp9, 1
  store i32 %inc10, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  %tmp11 = load i32* %j, align 4
  %tmp12 = load i32* %n, align 4
  %cmp13 = icmp ne i32 %tmp11, %tmp12
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end
  br label %for.inc14

for.inc14:                                        ; preds = %if.end
  %tmp15 = load i32* %i.addr, align 4
  %dec = add nsw i32 %tmp15, -1
  store i32 %dec, i32* %i.addr, align 4
  br label %for.cond

for.end16:                                        ; preds = %for.cond
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 2)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
