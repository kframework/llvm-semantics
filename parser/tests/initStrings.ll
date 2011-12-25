; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/initStrings.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.s1 = internal unnamed_addr constant [2 x i8] c"x\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca [2 x i8], align 1
  %s2 = alloca [2 x i8], align 1
  store i32 0, i32* %retval
  %tmp = bitcast [2 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([2 x i8]* @main.s1, i32 0, i32 0), i64 2, i32 1, i1 false)
  %tmp2 = bitcast [2 x i8]* %s2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 2, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [2 x i8]* %s1, i32 0, i64 0
  %tmp3 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp3 to i32
  %cmp = icmp ne i32 %conv, 120
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx5 = getelementptr inbounds [2 x i8]* %s1, i32 0, i64 1
  %tmp6 = load i8* %arrayidx5, align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp ne i32 %conv7, 0
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.end
  %arrayidx12 = getelementptr inbounds [2 x i8]* %s2, i32 0, i64 0
  %tmp13 = load i8* %arrayidx12, align 1
  %conv14 = sext i8 %tmp13 to i32
  %cmp15 = icmp ne i32 %conv14, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end11
  store i32 3, i32* %retval
  br label %return

if.end18:                                         ; preds = %if.end11
  %arrayidx19 = getelementptr inbounds [2 x i8]* %s2, i32 0, i64 1
  %tmp20 = load i8* %arrayidx19, align 1
  %conv21 = sext i8 %tmp20 to i32
  %cmp22 = icmp ne i32 %conv21, 0
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end18
  store i32 4, i32* %retval
  br label %return

if.end25:                                         ; preds = %if.end18
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end25, %if.then24, %if.then17, %if.then10, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
