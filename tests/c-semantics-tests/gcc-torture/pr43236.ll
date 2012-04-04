; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43236.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %A = alloca [30 x i8], align 16
  %B = alloca [30 x i8], align 16
  %C = alloca [30 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [30 x i8]* %A, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 1, i64 30, i32 1, i1 false)
  %arraydecay1 = getelementptr inbounds [30 x i8]* %B, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay1, i8 1, i64 30, i32 1, i1 false)
  store i32 20, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32* %i, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %i, align 4
  %cmp = icmp sgt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [30 x i8]* %A, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  %2 = load i32* %i, align 4
  %idxprom2 = sext i32 %2 to i64
  %arrayidx3 = getelementptr inbounds [30 x i8]* %B, i32 0, i64 %idxprom2
  store i8 0, i8* %arrayidx3, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [30 x i8]* %C, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay4, i8 1, i64 30, i32 1, i1 false)
  %arraydecay5 = getelementptr inbounds [30 x i8]* %C, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8* %arraydecay5, i64 10
  call void @llvm.memset.p0i8.i64(i8* %add.ptr, i8 0, i64 10, i32 1, i1 false)
  %arraydecay6 = getelementptr inbounds [30 x i8]* %A, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [30 x i8]* %C, i32 0, i32 0
  %call = call i32 @memcmp(i8* %arraydecay6, i8* %arraydecay7, i64 30)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %arraydecay8 = getelementptr inbounds [30 x i8]* %B, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [30 x i8]* %C, i32 0, i32 0
  %call10 = call i32 @memcmp(i8* %arraydecay8, i8* %arraydecay9, i64 30)
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @memcmp(i8*, i8*, i64)

declare void @abort() noreturn
