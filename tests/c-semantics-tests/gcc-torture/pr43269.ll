; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43269.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_261 = common global i32 0, align 4
@g_21 = common global i32 0, align 4
@g_211 = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func_32(i32 0)
  %0 = load i32* @g_261, align 4
  %cmp = icmp ne i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal void @func_32(i32 %b) nounwind uwtable noinline {
entry:
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %lbl_370

lbl_370:                                          ; preds = %if.else, %if.then
  store i32 1, i32* @g_21, align 4
  br label %if.end

if.end:                                           ; preds = %lbl_370, %entry
  store i32 -1, i32* @g_261, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32* @g_261, align 4
  %cmp = icmp sgt i32 %1, -2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* @g_211, align 4
  %add = add nsw i32 %2, 1
  %tobool1 = icmp ne i32 %add, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %for.body
  br label %for.end

if.else:                                          ; preds = %for.body
  store i32 1, i32* @g_21, align 4
  br label %lbl_370

for.inc:                                          ; No predecessors!
  %3 = load i32* @g_261, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @g_261, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then2, %for.cond
  ret void
}

declare void @abort() noreturn nounwind
