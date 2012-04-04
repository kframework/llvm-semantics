; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Struct3 = type <{ i32, [0 x %union.Union] }>
%union.Union = type { %struct.Struct2 }
%struct.Struct2 = type <{ i16, i16, i16, i64, i64, i64 }>
%struct.Struct1 = type <{ i16, i16, i16, i64, i64 }>

define i64 @Sum(%struct.Struct3* %instrs) nounwind uwtable noinline {
entry:
  %instrs.addr = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %instrs.addr, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load %struct.Struct3** %instrs.addr, align 8
  %Count = getelementptr inbounds %struct.Struct3* %1, i32 0, i32 0
  %2 = load i32* %Count, align 1
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load %struct.Struct3** %instrs.addr, align 8
  %List = getelementptr inbounds %struct.Struct3* %4, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 %idxprom
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count1 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 3
  %5 = load i64* %Count1, align 1
  %6 = load i64* %count, align 8
  %add = add i64 %6, %5
  store i64 %add, i64* %count, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i64* %count, align 8
  ret i64 %8
}

define i64 @Sum2(%struct.Struct3* %instrs) nounwind uwtable noinline {
entry:
  %instrs.addr = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %instrs.addr, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load %struct.Struct3** %instrs.addr, align 8
  %Count = getelementptr inbounds %struct.Struct3* %1, i32 0, i32 0
  %2 = load i32* %Count, align 1
  %cmp = icmp slt i32 %0, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load %struct.Struct3** %instrs.addr, align 8
  %List = getelementptr inbounds %struct.Struct3* %4, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 %idxprom
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count2 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 4
  %5 = load i64* %Count2, align 1
  %6 = load i64* %count, align 8
  %add = add nsw i64 %6, %5
  store i64 %add, i64* %count, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i64* %count, align 8
  ret i64 %8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.Struct3*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 94) nounwind
  %0 = bitcast i8* %call to %struct.Struct3*
  store %struct.Struct3* %0, %struct.Struct3** %p, align 8
  %1 = load %struct.Struct3** %p, align 8
  %2 = bitcast %struct.Struct3* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 94, i32 1, i1 false)
  %3 = load %struct.Struct3** %p, align 8
  %Count = getelementptr inbounds %struct.Struct3* %3, i32 0, i32 0
  store i32 3, i32* %Count, align 1
  %4 = load %struct.Struct3** %p, align 8
  %List = getelementptr inbounds %struct.Struct3* %4, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 0
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count1 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 3
  store i64 555, i64* %Count1, align 1
  %5 = load %struct.Struct3** %p, align 8
  %List2 = getelementptr inbounds %struct.Struct3* %5, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [0 x %union.Union]* %List2, i32 0, i64 1
  %a4 = bitcast %union.Union* %arrayidx3 to %struct.Struct1*
  %Count5 = getelementptr inbounds %struct.Struct1* %a4, i32 0, i32 3
  store i64 999, i64* %Count5, align 1
  %6 = load %struct.Struct3** %p, align 8
  %List6 = getelementptr inbounds %struct.Struct3* %6, i32 0, i32 1
  %arrayidx7 = getelementptr inbounds [0 x %union.Union]* %List6, i32 0, i64 2
  %a8 = bitcast %union.Union* %arrayidx7 to %struct.Struct1*
  %Count9 = getelementptr inbounds %struct.Struct1* %a8, i32 0, i32 3
  store i64 4311810305, i64* %Count9, align 1
  %7 = load %struct.Struct3** %p, align 8
  %List10 = getelementptr inbounds %struct.Struct3* %7, i32 0, i32 1
  %arrayidx11 = getelementptr inbounds [0 x %union.Union]* %List10, i32 0, i64 0
  %a12 = bitcast %union.Union* %arrayidx11 to %struct.Struct1*
  %Count2 = getelementptr inbounds %struct.Struct1* %a12, i32 0, i32 4
  store i64 555, i64* %Count2, align 1
  %8 = load %struct.Struct3** %p, align 8
  %List13 = getelementptr inbounds %struct.Struct3* %8, i32 0, i32 1
  %arrayidx14 = getelementptr inbounds [0 x %union.Union]* %List13, i32 0, i64 1
  %a15 = bitcast %union.Union* %arrayidx14 to %struct.Struct1*
  %Count216 = getelementptr inbounds %struct.Struct1* %a15, i32 0, i32 4
  store i64 999, i64* %Count216, align 1
  %9 = load %struct.Struct3** %p, align 8
  %List17 = getelementptr inbounds %struct.Struct3* %9, i32 0, i32 1
  %arrayidx18 = getelementptr inbounds [0 x %union.Union]* %List17, i32 0, i64 2
  %a19 = bitcast %union.Union* %arrayidx18 to %struct.Struct1*
  %Count220 = getelementptr inbounds %struct.Struct1* %a19, i32 0, i32 4
  store i64 4311810305, i64* %Count220, align 1
  %10 = load %struct.Struct3** %p, align 8
  %call21 = call i64 @Sum(%struct.Struct3* %10)
  %cmp = icmp ne i64 %call21, 4311811859
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %11 = load %struct.Struct3** %p, align 8
  %call22 = call i64 @Sum2(%struct.Struct3* %11)
  %cmp23 = icmp ne i64 %call22, 4311811859
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
