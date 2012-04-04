; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36691.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = common global i8 0, align 1

define void @func_1() nounwind uwtable {
entry:
  store i8 9, i8* @g_5, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* @g_5, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp sge i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i8* @g_5, align 1
  %conv2 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv2, 5
  %conv3 = trunc i32 %sub to i8
  store i8 %conv3, i8* @g_5, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func_1()
  %0 = load i8* @g_5, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
