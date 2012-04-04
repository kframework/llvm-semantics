; ModuleID = '/home/david/src/c-semantics/tests/unitTests/initStrings.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.s1 = private unnamed_addr constant [2 x i8] c"x\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca [2 x i8], align 1
  %s2 = alloca [2 x i8], align 1
  store i32 0, i32* %retval
  %0 = bitcast [2 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([2 x i8]* @main.s1, i32 0, i32 0), i64 2, i32 1, i1 false)
  %1 = bitcast [2 x i8]* %s2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 2, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [2 x i8]* %s1, i32 0, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 120
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx2 = getelementptr inbounds [2 x i8]* %s1, i32 0, i64 1
  %3 = load i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp ne i32 %conv3, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end7:                                          ; preds = %if.end
  %arrayidx8 = getelementptr inbounds [2 x i8]* %s2, i32 0, i64 0
  %4 = load i8* %arrayidx8, align 1
  %conv9 = sext i8 %4 to i32
  %cmp10 = icmp ne i32 %conv9, 0
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  store i32 3, i32* %retval
  br label %return

if.end13:                                         ; preds = %if.end7
  %arrayidx14 = getelementptr inbounds [2 x i8]* %s2, i32 0, i64 1
  %5 = load i8* %arrayidx14, align 1
  %conv15 = sext i8 %5 to i32
  %cmp16 = icmp ne i32 %conv15, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  store i32 4, i32* %retval
  br label %return

if.end19:                                         ; preds = %if.end13
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end19, %if.then18, %if.then12, %if.then6, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
