; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/argPromote.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

define zeroext i8 @g(i8 signext %x) nounwind uwtable {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %tmp = load i8* %x.addr, align 1
  %conv = sext i8 %tmp to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp1 = load i8* %x.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %add = add nsw i32 %conv2, 1
  %conv3 = trunc i32 %add to i8
  ret i8 %conv3
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 12, i8* %x, align 1
  %call = call i32 @f(i32 5)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  %call2 = call zeroext i8 @g(i8 signext 6)
  %conv = zext i8 %call2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 8)
  %tmp = load i8* %x, align 1
  %conv5 = sext i8 %tmp to i32
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %conv5)
  %0 = load i32* %retval
  ret i32 %0
}
