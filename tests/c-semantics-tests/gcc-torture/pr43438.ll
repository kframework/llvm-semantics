; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43438.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = internal global i8 1, align 1
@l_8 = internal global i32* @g_9, align 8
@g_9 = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_11 = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 -2, i8* %l_11, align 1
  %0 = load i8* @g_2, align 1
  %conv = zext i8 %0 to i32
  %1 = load i32** @l_8, align 8
  %2 = load i32* %1, align 4
  %or = or i32 %2, %conv
  store i32 %or, i32* %1, align 4
  %3 = load i32** @l_8, align 8
  %4 = load i32* %3, align 4
  %5 = load i8* %l_11, align 1
  %conv1 = zext i8 %5 to i32
  %or2 = or i32 %conv1, %4
  %conv3 = trunc i32 %or2 to i8
  store i8 %conv3, i8* %l_11, align 1
  %6 = load i8* %l_11, align 1
  %conv4 = zext i8 %6 to i32
  call void @func_12(i32 %conv4)
  %7 = load i32* @g_9, align 4
  %cmp = icmp ne i32 %7, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal void @func_12(i32 %p_13) nounwind uwtable {
entry:
  %p_13.addr = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  store i32 %p_13, i32* %p_13.addr, align 4
  store i32* @g_9, i32** %l_17, align 8
  %0 = load i32* %p_13.addr, align 4
  %cmp = icmp slt i32 0, %0
  %conv = zext i1 %cmp to i32
  %1 = load i32** %l_17, align 8
  %2 = load i32* %1, align 4
  %and = and i32 %2, %conv
  store i32 %and, i32* %1, align 4
  ret void
}

declare void @abort() noreturn nounwind
