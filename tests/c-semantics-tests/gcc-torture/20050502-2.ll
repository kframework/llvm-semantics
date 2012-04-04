; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050502-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.x = private unnamed_addr constant [11 x i8] c"IJKLMNOPQR\00", align 1
@.str = private unnamed_addr constant [11 x i8] c"IJKL\00NOPQR\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"IJKLMNOP\00R\00", align 1

define void @foo(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %2 = load i32* %i, align 4
  %3 = load i32* %i, align 4
  %add = add nsw i32 %2, %3
  %idxprom = sext i32 %add to i64
  %4 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  ret void
}

define void @bar(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %2 = load i32* %i, align 4
  %3 = load i32* %i, align 4
  %add = add nsw i32 %2, %3
  %4 = load i32* %i, align 4
  %add1 = add nsw i32 %add, %4
  %5 = load i32* %i, align 4
  %add2 = add nsw i32 %add1, %5
  %idxprom = sext i32 %add2 to i64
  %6 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %6, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [11 x i8], align 1
  store i32 0, i32* %retval
  %0 = bitcast [11 x i8]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([11 x i8]* @main.x, i32 0, i32 0), i64 11, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @foo(i8* %arraydecay)
  %arraydecay1 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %call = call i32 @memcmp(i8* %arraydecay1, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i64 11)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds [11 x i8]* %x, i32 0, i64 4
  store i8 77, i8* %arrayidx, align 1
  %arraydecay2 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @bar(i8* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %call4 = call i32 @memcmp(i8* %arraydecay3, i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i64 11)
  %cmp5 = icmp ne i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @memcmp(i8*, i8*, i64)

declare void @abort() noreturn nounwind
