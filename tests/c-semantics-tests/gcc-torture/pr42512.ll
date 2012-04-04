; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42512.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = common global i16 0, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_2 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %l_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %l_2, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %l_2, align 4
  %2 = load i16* @g_3, align 2
  %conv = sext i16 %2 to i32
  %or = or i32 %conv, %1
  %conv1 = trunc i32 %or to i16
  store i16 %conv1, i16* @g_3, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %l_2, align 4
  %sub = sub nsw i32 %3, 1
  %conv2 = trunc i32 %sub to i8
  %conv3 = zext i8 %conv2 to i32
  store i32 %conv3, i32* %l_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i16* @g_3, align 2
  %conv4 = sext i16 %4 to i32
  %cmp5 = icmp ne i32 %conv4, -1
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind
