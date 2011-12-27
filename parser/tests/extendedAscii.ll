; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/extendedAscii.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@f = internal constant [2 x i8] c"\FF\00", align 1
@g = internal constant [2 x i8] c"\FF\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i8* getelementptr inbounds ([2 x i8]* @f, i32 0, i64 0), align 1
  %conv = zext i8 %tmp to i32
  %tmp1 = load i8* getelementptr inbounds ([2 x i8]* @g, i32 0, i64 0), align 1
  %conv2 = zext i8 %tmp1 to i32
  %cmp = icmp ne i32 %conv, %conv2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 3, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp4 = load i8* getelementptr inbounds ([2 x i8]* @f, i32 0, i64 1), align 1
  %conv5 = zext i8 %tmp4 to i32
  %tmp6 = load i8* getelementptr inbounds ([2 x i8]* @g, i32 0, i64 1), align 1
  %conv7 = zext i8 %tmp6 to i32
  %cmp8 = icmp ne i32 %conv5, %conv7
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i32 4, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end11, %if.then10, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
