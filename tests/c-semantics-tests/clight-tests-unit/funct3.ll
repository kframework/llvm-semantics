; ModuleID = '/home/david/src/c-semantics/tests/clight-tests-unit/funct3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define zeroext i8 @foo(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %0 = load i16* %n.addr, align 2
  %conv = zext i16 %0 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  ret i8 -30
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i8 @foo(i16 zeroext 7616)
  %conv = zext i8 %call to i32
  store i32 %conv, i32* %x, align 4
  %0 = load i32* %x, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}
