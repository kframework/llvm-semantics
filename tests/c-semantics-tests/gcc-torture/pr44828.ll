; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44828.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 274686410, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 53671368, i32* %b, align 4
  %0 = load i32* %b, align 4
  %conv = trunc i32 %0 to i8
  %1 = load i32* @a, align 4
  %conv1 = trunc i32 %1 to i8
  %call = call signext i8 @foo(i8 signext %conv, i8 signext %conv1)
  %conv2 = sext i8 %call to i32
  %cmp = icmp sgt i32 %conv2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

define internal signext i8 @foo(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %0 = load i8* %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %si2.addr, align 1
  %conv1 = sext i8 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i8
  ret i8 %conv2
}

declare void @abort() noreturn
