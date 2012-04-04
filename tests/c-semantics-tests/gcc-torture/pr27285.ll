; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27285.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, i8, [16 x i8] }

@main.x = private unnamed_addr constant %struct.S { i8 0, i8 25, i8 0, [16 x i8] c"\AA\BB\CC\DD\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

define void @foo(%struct.S* %x, %struct.S* %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca %struct.S*, align 8
  %y.addr = alloca %struct.S*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i8, align 1
  %d = alloca i8*, align 8
  %e = alloca i8*, align 8
  store %struct.S* %x, %struct.S** %x.addr, align 8
  store %struct.S* %y, %struct.S** %y.addr, align 8
  %0 = load %struct.S** %x.addr, align 8
  %b1 = getelementptr inbounds %struct.S* %0, i32 0, i32 1
  %1 = load i8* %b1, align 1
  %conv = zext i8 %1 to i32
  store i32 %conv, i32* %b, align 4
  %2 = load %struct.S** %x.addr, align 8
  %d2 = getelementptr inbounds %struct.S* %2, i32 0, i32 3
  %arraydecay = getelementptr inbounds [16 x i8]* %d2, i32 0, i32 0
  store i8* %arraydecay, i8** %d, align 8
  %3 = load %struct.S** %y.addr, align 8
  %d3 = getelementptr inbounds %struct.S* %3, i32 0, i32 3
  %arraydecay4 = getelementptr inbounds [16 x i8]* %d3, i32 0, i32 0
  store i8* %arraydecay4, i8** %e, align 8
  store i32 0, i32* %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %4 = load i32* %b, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32* %b, align 4
  %cmp = icmp sge i32 %5, 8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  store i8 -1, i8* %c, align 1
  %6 = load i32* %b, align 4
  %sub = sub nsw i32 %6, 8
  store i32 %sub, i32* %b, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %7 = load i32* %b, align 4
  %sub6 = sub nsw i32 8, %7
  %shl = shl i32 255, %sub6
  %conv7 = trunc i32 %shl to i8
  store i8 %conv7, i8* %c, align 1
  store i32 0, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32* %a, align 4
  %idxprom = sext i32 %8 to i64
  %9 = load i8** %d, align 8
  %arrayidx = getelementptr inbounds i8* %9, i64 %idxprom
  %10 = load i8* %arrayidx, align 1
  %conv8 = zext i8 %10 to i32
  %11 = load i8* %c, align 1
  %conv9 = zext i8 %11 to i32
  %and = and i32 %conv8, %conv9
  %conv10 = trunc i32 %and to i8
  %12 = load i32* %a, align 4
  %idxprom11 = sext i32 %12 to i64
  %13 = load i8** %e, align 8
  %arrayidx12 = getelementptr inbounds i8* %13, i64 %idxprom11
  store i8 %conv10, i8* %arrayidx12, align 1
  %14 = load i32* %a, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %a, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.S, align 1
  %y = alloca %struct.S, align 1
  store i32 0, i32* %retval
  %0 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.S* @main.x, i32 0, i32 0), i64 19, i32 1, i1 false)
  %1 = bitcast %struct.S* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 19, i32 1, i1 false)
  call void @foo(%struct.S* %x, %struct.S* %y)
  %d = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx = getelementptr inbounds [16 x i8]* %d, i32 0, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv = zext i8 %2 to i32
  %d1 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx2 = getelementptr inbounds [16 x i8]* %d1, i32 0, i64 0
  %3 = load i8* %arrayidx2, align 1
  %conv3 = zext i8 %3 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %d5 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx6 = getelementptr inbounds [16 x i8]* %d5, i32 0, i64 1
  %4 = load i8* %arrayidx6, align 1
  %conv7 = zext i8 %4 to i32
  %d8 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx9 = getelementptr inbounds [16 x i8]* %d8, i32 0, i64 1
  %5 = load i8* %arrayidx9, align 1
  %conv10 = zext i8 %5 to i32
  %cmp11 = icmp ne i32 %conv7, %conv10
  br i1 %cmp11, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false
  %d14 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx15 = getelementptr inbounds [16 x i8]* %d14, i32 0, i64 2
  %6 = load i8* %arrayidx15, align 1
  %conv16 = zext i8 %6 to i32
  %d17 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx18 = getelementptr inbounds [16 x i8]* %d17, i32 0, i64 2
  %7 = load i8* %arrayidx18, align 1
  %conv19 = zext i8 %7 to i32
  %cmp20 = icmp ne i32 %conv16, %conv19
  br i1 %cmp20, label %if.then, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false13
  %d23 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx24 = getelementptr inbounds [16 x i8]* %d23, i32 0, i64 3
  %8 = load i8* %arrayidx24, align 1
  %conv25 = zext i8 %8 to i32
  %and = and i32 %conv25, 128
  %d26 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx27 = getelementptr inbounds [16 x i8]* %d26, i32 0, i64 3
  %9 = load i8* %arrayidx27, align 1
  %conv28 = zext i8 %9 to i32
  %cmp29 = icmp ne i32 %and, %conv28
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false22, %lor.lhs.false13, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false22
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
