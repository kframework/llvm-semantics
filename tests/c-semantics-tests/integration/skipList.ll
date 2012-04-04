; ModuleID = '/home/david/src/c-semantics/tests/integration/skipList.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sn = type { i32, %struct.sn** }
%struct.SkipSet = type { %struct.sn*, i32 }

@random_level.first = internal global i32 1, align 4
@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"}\0A\00", align 1
@.str4 = private unnamed_addr constant [18 x i8] c"7 is in the list\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"7 has been deleted\0A\00", align 1

define float @frand() nounwind uwtable {
entry:
  %call = call i32 @rand() nounwind
  %conv = sitofp i32 %call to float
  %div = fdiv float %conv, 0x41E0000000000000
  ret float %div
}

declare i32 @rand() nounwind

define i32 @random_level() nounwind uwtable {
entry:
  %lvl = alloca i32, align 4
  store i32 0, i32* %lvl, align 4
  %0 = load i32* @random_level.first, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @random_level.first, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %call = call float @frand()
  %conv = fpext float %call to double
  %cmp = fcmp olt double %conv, 5.000000e-01
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32* %lvl, align 4
  %cmp2 = icmp slt i32 %1, 6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %2 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %2, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %3 = load i32* %lvl, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %lvl, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %4 = load i32* %lvl, align 4
  ret i32 %4
}

define %struct.sn* @make_node(i32 %level, i32 %value) nounwind uwtable {
entry:
  %level.addr = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %sn = alloca %struct.sn*, align 8
  %i = alloca i32, align 4
  store i32 %level, i32* %level.addr, align 4
  store i32 %value, i32* %value.addr, align 4
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.sn*
  store %struct.sn* %0, %struct.sn** %sn, align 8
  %1 = load i32* %level.addr, align 4
  %add = add nsw i32 %1, 1
  %conv = sext i32 %add to i64
  %mul = mul i64 %conv, 8
  %call1 = call noalias i8* @malloc(i64 %mul) nounwind
  %2 = bitcast i8* %call1 to %struct.sn**
  %3 = load %struct.sn** %sn, align 8
  %forward = getelementptr inbounds %struct.sn* %3, i32 0, i32 1
  store %struct.sn** %2, %struct.sn*** %forward, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4
  %5 = load i32* %level.addr, align 4
  %add2 = add nsw i32 %5, 1
  %cmp = icmp slt i32 %4, %add2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load %struct.sn** %sn, align 8
  %forward4 = getelementptr inbounds %struct.sn* %7, i32 0, i32 1
  %8 = load %struct.sn*** %forward4, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %8, i64 %idxprom
  store %struct.sn* null, %struct.sn** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i32* %value.addr, align 4
  %11 = load %struct.sn** %sn, align 8
  %value5 = getelementptr inbounds %struct.sn* %11, i32 0, i32 0
  store i32 %10, i32* %value5, align 4
  %12 = load %struct.sn** %sn, align 8
  ret %struct.sn* %12
}

declare noalias i8* @malloc(i64) nounwind

define %struct.SkipSet* @make_skipset() nounwind uwtable {
entry:
  %ss = alloca %struct.SkipSet*, align 8
  %call = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.SkipSet*
  store %struct.SkipSet* %0, %struct.SkipSet** %ss, align 8
  %call1 = call %struct.sn* @make_node(i32 6, i32 0)
  %1 = load %struct.SkipSet** %ss, align 8
  %header = getelementptr inbounds %struct.SkipSet* %1, i32 0, i32 0
  store %struct.sn* %call1, %struct.sn** %header, align 8
  %2 = load %struct.SkipSet** %ss, align 8
  %level = getelementptr inbounds %struct.SkipSet* %2, i32 0, i32 1
  store i32 0, i32* %level, align 4
  %3 = load %struct.SkipSet** %ss, align 8
  ret %struct.SkipSet* %3
}

define void @print_skipset(%struct.SkipSet* %ss) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  %0 = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %0, i32 0, i32 0
  %1 = load %struct.sn** %header, align 8
  %forward = getelementptr inbounds %struct.sn* %1, i32 0, i32 1
  %2 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %2, i64 0
  %3 = load %struct.sn** %arrayidx, align 8
  store %struct.sn* %3, %struct.sn** %x, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %4 = load %struct.sn** %x, align 8
  %cmp = icmp ne %struct.sn* %4, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load %struct.sn** %x, align 8
  %value = getelementptr inbounds %struct.sn* %5, i32 0, i32 0
  %6 = load i32* %value, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %7 = load %struct.sn** %x, align 8
  %forward2 = getelementptr inbounds %struct.sn* %7, i32 0, i32 1
  %8 = load %struct.sn*** %forward2, align 8
  %arrayidx3 = getelementptr inbounds %struct.sn** %8, i64 0
  %9 = load %struct.sn** %arrayidx3, align 8
  store %struct.sn* %9, %struct.sn** %x, align 8
  %10 = load %struct.sn** %x, align 8
  %cmp4 = icmp ne %struct.sn* %10, null
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @contains(%struct.SkipSet* %ss, i32 %search_value) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ss.addr = alloca %struct.SkipSet*, align 8
  %search_value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %search_value, i32* %search_value.addr, align 4
  %0 = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %0, i32 0, i32 0
  %1 = load %struct.sn** %header, align 8
  store %struct.sn* %1, %struct.sn** %x, align 8
  %2 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %2, i32 0, i32 1
  %3 = load i32* %level, align 4
  store i32 %3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4
  %cmp = icmp sge i32 %4, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %5 = load i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %6 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %6, i32 0, i32 1
  %7 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %7, i64 %idxprom
  %8 = load %struct.sn** %arrayidx, align 8
  %cmp1 = icmp ne %struct.sn* %8, null
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %9 = load i32* %i, align 4
  %idxprom2 = sext i32 %9 to i64
  %10 = load %struct.sn** %x, align 8
  %forward3 = getelementptr inbounds %struct.sn* %10, i32 0, i32 1
  %11 = load %struct.sn*** %forward3, align 8
  %arrayidx4 = getelementptr inbounds %struct.sn** %11, i64 %idxprom2
  %12 = load %struct.sn** %arrayidx4, align 8
  %value = getelementptr inbounds %struct.sn* %12, i32 0, i32 0
  %13 = load i32* %value, align 4
  %14 = load i32* %search_value.addr, align 4
  %cmp5 = icmp slt i32 %13, %14
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %15 = phi i1 [ false, %while.cond ], [ %cmp5, %land.rhs ]
  br i1 %15, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %16 = load i32* %i, align 4
  %idxprom6 = sext i32 %16 to i64
  %17 = load %struct.sn** %x, align 8
  %forward7 = getelementptr inbounds %struct.sn* %17, i32 0, i32 1
  %18 = load %struct.sn*** %forward7, align 8
  %arrayidx8 = getelementptr inbounds %struct.sn** %18, i64 %idxprom6
  %19 = load %struct.sn** %arrayidx8, align 8
  store %struct.sn* %19, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %20 = load i32* %i, align 4
  %dec = add nsw i32 %20, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load %struct.sn** %x, align 8
  %forward9 = getelementptr inbounds %struct.sn* %21, i32 0, i32 1
  %22 = load %struct.sn*** %forward9, align 8
  %arrayidx10 = getelementptr inbounds %struct.sn** %22, i64 0
  %23 = load %struct.sn** %arrayidx10, align 8
  store %struct.sn* %23, %struct.sn** %x, align 8
  %24 = load %struct.sn** %x, align 8
  %cmp11 = icmp ne %struct.sn* %24, null
  br i1 %cmp11, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.end
  %25 = load %struct.sn** %x, align 8
  %value12 = getelementptr inbounds %struct.sn* %25, i32 0, i32 0
  %26 = load i32* %value12, align 4
  %27 = load i32* %search_value.addr, align 4
  %cmp13 = icmp eq i32 %26, %27
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %for.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %28 = load i32* %retval
  ret i32 %28
}

define void @insert(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  %guard = alloca i32, align 4
  %lvl = alloca i32, align 4
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  %0 = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %0, i32 0, i32 0
  %1 = load %struct.sn** %header, align 8
  store %struct.sn* %1, %struct.sn** %x, align 8
  %arraydecay = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i32 0
  %2 = bitcast %struct.sn** %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 7, i32 8, i1 false)
  %3 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %3, i32 0, i32 1
  %4 = load i32* %level, align 4
  store i32 %4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32* %i, align 4
  %cmp = icmp sge i32 %5, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %7, i32 0, i32 1
  %8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %8, i64 %idxprom
  %9 = load %struct.sn** %arrayidx, align 8
  %cmp1 = icmp ne %struct.sn* %9, null
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %10 = load i32* %i, align 4
  %idxprom2 = sext i32 %10 to i64
  %11 = load %struct.sn** %x, align 8
  %forward3 = getelementptr inbounds %struct.sn* %11, i32 0, i32 1
  %12 = load %struct.sn*** %forward3, align 8
  %arrayidx4 = getelementptr inbounds %struct.sn** %12, i64 %idxprom2
  %13 = load %struct.sn** %arrayidx4, align 8
  %value5 = getelementptr inbounds %struct.sn* %13, i32 0, i32 0
  %14 = load i32* %value5, align 4
  %15 = load i32* %value.addr, align 4
  %cmp6 = icmp slt i32 %14, %15
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %16 = phi i1 [ false, %while.cond ], [ %cmp6, %land.rhs ]
  br i1 %16, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %17 = load i32* %i, align 4
  %idxprom7 = sext i32 %17 to i64
  %18 = load %struct.sn** %x, align 8
  %forward8 = getelementptr inbounds %struct.sn* %18, i32 0, i32 1
  %19 = load %struct.sn*** %forward8, align 8
  %arrayidx9 = getelementptr inbounds %struct.sn** %19, i64 %idxprom7
  %20 = load %struct.sn** %arrayidx9, align 8
  store %struct.sn* %20, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %21 = load %struct.sn** %x, align 8
  %22 = load i32* %i, align 4
  %idxprom10 = sext i32 %22 to i64
  %arrayidx11 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom10
  store %struct.sn* %21, %struct.sn** %arrayidx11, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %23 = load i32* %i, align 4
  %dec = add nsw i32 %23, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %24 = load %struct.sn** %x, align 8
  %forward12 = getelementptr inbounds %struct.sn* %24, i32 0, i32 1
  %25 = load %struct.sn*** %forward12, align 8
  %arrayidx13 = getelementptr inbounds %struct.sn** %25, i64 0
  %26 = load %struct.sn** %arrayidx13, align 8
  store %struct.sn* %26, %struct.sn** %x, align 8
  %27 = load %struct.sn** %x, align 8
  %cmp14 = icmp eq %struct.sn* %27, null
  br i1 %cmp14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %28 = load %struct.sn** %x, align 8
  %value15 = getelementptr inbounds %struct.sn* %28, i32 0, i32 0
  %29 = load i32* %value15, align 4
  %30 = load i32* %value.addr, align 4
  %cmp16 = icmp ne i32 %29, %30
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end
  %31 = phi i1 [ true, %for.end ], [ %cmp16, %lor.rhs ]
  %lor.ext = zext i1 %31 to i32
  store i32 %lor.ext, i32* %guard, align 4
  %32 = load i32* %guard, align 4
  %tobool = icmp ne i32 %32, 0
  br i1 %tobool, label %if.then, label %if.end50

if.then:                                          ; preds = %lor.end
  %call = call i32 @random_level()
  store i32 %call, i32* %lvl, align 4
  %33 = load i32* %lvl, align 4
  %34 = load %struct.SkipSet** %ss.addr, align 8
  %level17 = getelementptr inbounds %struct.SkipSet* %34, i32 0, i32 1
  %35 = load i32* %level17, align 4
  %cmp18 = icmp sgt i32 %33, %35
  br i1 %cmp18, label %if.then19, label %if.end

if.then19:                                        ; preds = %if.then
  %36 = load %struct.SkipSet** %ss.addr, align 8
  %level20 = getelementptr inbounds %struct.SkipSet* %36, i32 0, i32 1
  %37 = load i32* %level20, align 4
  %add = add nsw i32 %37, 1
  store i32 %add, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc27, %if.then19
  %38 = load i32* %i, align 4
  %39 = load i32* %lvl, align 4
  %cmp22 = icmp sle i32 %38, %39
  br i1 %cmp22, label %for.body23, label %for.end28

for.body23:                                       ; preds = %for.cond21
  %40 = load %struct.SkipSet** %ss.addr, align 8
  %header24 = getelementptr inbounds %struct.SkipSet* %40, i32 0, i32 0
  %41 = load %struct.sn** %header24, align 8
  %42 = load i32* %i, align 4
  %idxprom25 = sext i32 %42 to i64
  %arrayidx26 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom25
  store %struct.sn* %41, %struct.sn** %arrayidx26, align 8
  br label %for.inc27

for.inc27:                                        ; preds = %for.body23
  %43 = load i32* %i, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond21

for.end28:                                        ; preds = %for.cond21
  %44 = load i32* %lvl, align 4
  %45 = load %struct.SkipSet** %ss.addr, align 8
  %level29 = getelementptr inbounds %struct.SkipSet* %45, i32 0, i32 1
  store i32 %44, i32* %level29, align 4
  br label %if.end

if.end:                                           ; preds = %for.end28, %if.then
  %46 = load i32* %lvl, align 4
  %47 = load i32* %value.addr, align 4
  %call30 = call %struct.sn* @make_node(i32 %46, i32 %47)
  store %struct.sn* %call30, %struct.sn** %x, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc47, %if.end
  %48 = load i32* %i, align 4
  %49 = load i32* %lvl, align 4
  %cmp32 = icmp sle i32 %48, %49
  br i1 %cmp32, label %for.body33, label %for.end49

for.body33:                                       ; preds = %for.cond31
  %50 = load i32* %i, align 4
  %idxprom34 = sext i32 %50 to i64
  %51 = load i32* %i, align 4
  %idxprom35 = sext i32 %51 to i64
  %arrayidx36 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom35
  %52 = load %struct.sn** %arrayidx36, align 8
  %forward37 = getelementptr inbounds %struct.sn* %52, i32 0, i32 1
  %53 = load %struct.sn*** %forward37, align 8
  %arrayidx38 = getelementptr inbounds %struct.sn** %53, i64 %idxprom34
  %54 = load %struct.sn** %arrayidx38, align 8
  %55 = load i32* %i, align 4
  %idxprom39 = sext i32 %55 to i64
  %56 = load %struct.sn** %x, align 8
  %forward40 = getelementptr inbounds %struct.sn* %56, i32 0, i32 1
  %57 = load %struct.sn*** %forward40, align 8
  %arrayidx41 = getelementptr inbounds %struct.sn** %57, i64 %idxprom39
  store %struct.sn* %54, %struct.sn** %arrayidx41, align 8
  %58 = load %struct.sn** %x, align 8
  %59 = load i32* %i, align 4
  %idxprom42 = sext i32 %59 to i64
  %60 = load i32* %i, align 4
  %idxprom43 = sext i32 %60 to i64
  %arrayidx44 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom43
  %61 = load %struct.sn** %arrayidx44, align 8
  %forward45 = getelementptr inbounds %struct.sn* %61, i32 0, i32 1
  %62 = load %struct.sn*** %forward45, align 8
  %arrayidx46 = getelementptr inbounds %struct.sn** %62, i64 %idxprom42
  store %struct.sn* %58, %struct.sn** %arrayidx46, align 8
  br label %for.inc47

for.inc47:                                        ; preds = %for.body33
  %63 = load i32* %i, align 4
  %inc48 = add nsw i32 %63, 1
  store i32 %inc48, i32* %i, align 4
  br label %for.cond31

for.end49:                                        ; preds = %for.cond31
  br label %if.end50

if.end50:                                         ; preds = %for.end49, %lor.end
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @delete(%struct.SkipSet* %ss, i32 %value) nounwind uwtable {
entry:
  %ss.addr = alloca %struct.SkipSet*, align 8
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca %struct.sn*, align 8
  %update = alloca [7 x %struct.sn*], align 16
  store %struct.SkipSet* %ss, %struct.SkipSet** %ss.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  %0 = load %struct.SkipSet** %ss.addr, align 8
  %header = getelementptr inbounds %struct.SkipSet* %0, i32 0, i32 0
  %1 = load %struct.sn** %header, align 8
  store %struct.sn* %1, %struct.sn** %x, align 8
  %arraydecay = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i32 0
  %2 = bitcast %struct.sn** %arraydecay to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 7, i32 8, i1 false)
  %3 = load %struct.SkipSet** %ss.addr, align 8
  %level = getelementptr inbounds %struct.SkipSet* %3, i32 0, i32 1
  %4 = load i32* %level, align 4
  store i32 %4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32* %i, align 4
  %cmp = icmp sge i32 %5, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %7 = load %struct.sn** %x, align 8
  %forward = getelementptr inbounds %struct.sn* %7, i32 0, i32 1
  %8 = load %struct.sn*** %forward, align 8
  %arrayidx = getelementptr inbounds %struct.sn** %8, i64 %idxprom
  %9 = load %struct.sn** %arrayidx, align 8
  %cmp1 = icmp ne %struct.sn* %9, null
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %10 = load i32* %i, align 4
  %idxprom2 = sext i32 %10 to i64
  %11 = load %struct.sn** %x, align 8
  %forward3 = getelementptr inbounds %struct.sn* %11, i32 0, i32 1
  %12 = load %struct.sn*** %forward3, align 8
  %arrayidx4 = getelementptr inbounds %struct.sn** %12, i64 %idxprom2
  %13 = load %struct.sn** %arrayidx4, align 8
  %value5 = getelementptr inbounds %struct.sn* %13, i32 0, i32 0
  %14 = load i32* %value5, align 4
  %15 = load i32* %value.addr, align 4
  %cmp6 = icmp slt i32 %14, %15
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %16 = phi i1 [ false, %while.cond ], [ %cmp6, %land.rhs ]
  br i1 %16, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %17 = load i32* %i, align 4
  %idxprom7 = sext i32 %17 to i64
  %18 = load %struct.sn** %x, align 8
  %forward8 = getelementptr inbounds %struct.sn* %18, i32 0, i32 1
  %19 = load %struct.sn*** %forward8, align 8
  %arrayidx9 = getelementptr inbounds %struct.sn** %19, i64 %idxprom7
  %20 = load %struct.sn** %arrayidx9, align 8
  store %struct.sn* %20, %struct.sn** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %21 = load %struct.sn** %x, align 8
  %22 = load i32* %i, align 4
  %idxprom10 = sext i32 %22 to i64
  %arrayidx11 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom10
  store %struct.sn* %21, %struct.sn** %arrayidx11, align 8
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %23 = load i32* %i, align 4
  %dec = add nsw i32 %23, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %24 = load %struct.sn** %x, align 8
  %forward12 = getelementptr inbounds %struct.sn* %24, i32 0, i32 1
  %25 = load %struct.sn*** %forward12, align 8
  %arrayidx13 = getelementptr inbounds %struct.sn** %25, i64 0
  %26 = load %struct.sn** %arrayidx13, align 8
  store %struct.sn* %26, %struct.sn** %x, align 8
  %27 = load %struct.sn** %x, align 8
  %value14 = getelementptr inbounds %struct.sn* %27, i32 0, i32 0
  %28 = load i32* %value14, align 4
  %29 = load i32* %value.addr, align 4
  %cmp15 = icmp eq i32 %28, %29
  br i1 %cmp15, label %if.then, label %if.end52

if.then:                                          ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc35, %if.then
  %30 = load i32* %i, align 4
  %31 = load %struct.SkipSet** %ss.addr, align 8
  %level17 = getelementptr inbounds %struct.SkipSet* %31, i32 0, i32 1
  %32 = load i32* %level17, align 4
  %cmp18 = icmp sle i32 %30, %32
  br i1 %cmp18, label %for.body19, label %for.end36

for.body19:                                       ; preds = %for.cond16
  %33 = load i32* %i, align 4
  %idxprom20 = sext i32 %33 to i64
  %34 = load i32* %i, align 4
  %idxprom21 = sext i32 %34 to i64
  %arrayidx22 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom21
  %35 = load %struct.sn** %arrayidx22, align 8
  %forward23 = getelementptr inbounds %struct.sn* %35, i32 0, i32 1
  %36 = load %struct.sn*** %forward23, align 8
  %arrayidx24 = getelementptr inbounds %struct.sn** %36, i64 %idxprom20
  %37 = load %struct.sn** %arrayidx24, align 8
  %38 = load %struct.sn** %x, align 8
  %cmp25 = icmp ne %struct.sn* %37, %38
  br i1 %cmp25, label %if.then26, label %if.end

if.then26:                                        ; preds = %for.body19
  br label %for.end36

if.end:                                           ; preds = %for.body19
  %39 = load i32* %i, align 4
  %idxprom27 = sext i32 %39 to i64
  %40 = load %struct.sn** %x, align 8
  %forward28 = getelementptr inbounds %struct.sn* %40, i32 0, i32 1
  %41 = load %struct.sn*** %forward28, align 8
  %arrayidx29 = getelementptr inbounds %struct.sn** %41, i64 %idxprom27
  %42 = load %struct.sn** %arrayidx29, align 8
  %43 = load i32* %i, align 4
  %idxprom30 = sext i32 %43 to i64
  %44 = load i32* %i, align 4
  %idxprom31 = sext i32 %44 to i64
  %arrayidx32 = getelementptr inbounds [7 x %struct.sn*]* %update, i32 0, i64 %idxprom31
  %45 = load %struct.sn** %arrayidx32, align 8
  %forward33 = getelementptr inbounds %struct.sn* %45, i32 0, i32 1
  %46 = load %struct.sn*** %forward33, align 8
  %arrayidx34 = getelementptr inbounds %struct.sn** %46, i64 %idxprom30
  store %struct.sn* %42, %struct.sn** %arrayidx34, align 8
  br label %for.inc35

for.inc35:                                        ; preds = %if.end
  %47 = load i32* %i, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond16

for.end36:                                        ; preds = %if.then26, %for.cond16
  %48 = load %struct.sn** %x, align 8
  %49 = bitcast %struct.sn* %48 to i8*
  call void @free(i8* %49) nounwind
  br label %while.cond37

while.cond37:                                     ; preds = %while.body48, %for.end36
  %50 = load %struct.SkipSet** %ss.addr, align 8
  %level38 = getelementptr inbounds %struct.SkipSet* %50, i32 0, i32 1
  %51 = load i32* %level38, align 4
  %cmp39 = icmp sgt i32 %51, 0
  br i1 %cmp39, label %land.rhs40, label %land.end47

land.rhs40:                                       ; preds = %while.cond37
  %52 = load %struct.SkipSet** %ss.addr, align 8
  %level41 = getelementptr inbounds %struct.SkipSet* %52, i32 0, i32 1
  %53 = load i32* %level41, align 4
  %idxprom42 = sext i32 %53 to i64
  %54 = load %struct.SkipSet** %ss.addr, align 8
  %header43 = getelementptr inbounds %struct.SkipSet* %54, i32 0, i32 0
  %55 = load %struct.sn** %header43, align 8
  %forward44 = getelementptr inbounds %struct.sn* %55, i32 0, i32 1
  %56 = load %struct.sn*** %forward44, align 8
  %arrayidx45 = getelementptr inbounds %struct.sn** %56, i64 %idxprom42
  %57 = load %struct.sn** %arrayidx45, align 8
  %cmp46 = icmp eq %struct.sn* %57, null
  br label %land.end47

land.end47:                                       ; preds = %land.rhs40, %while.cond37
  %58 = phi i1 [ false, %while.cond37 ], [ %cmp46, %land.rhs40 ]
  br i1 %58, label %while.body48, label %while.end51

while.body48:                                     ; preds = %land.end47
  %59 = load %struct.SkipSet** %ss.addr, align 8
  %level49 = getelementptr inbounds %struct.SkipSet* %59, i32 0, i32 1
  %60 = load i32* %level49, align 4
  %dec50 = add nsw i32 %60, -1
  store i32 %dec50, i32* %level49, align 4
  br label %while.cond37

while.end51:                                      ; preds = %land.end47
  br label %if.end52

if.end52:                                         ; preds = %while.end51, %for.end
  ret void
}

declare void @free(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ss = alloca %struct.SkipSet*, align 8
  store i32 0, i32* %retval
  %call = call %struct.SkipSet* @make_skipset()
  store %struct.SkipSet* %call, %struct.SkipSet** %ss, align 8
  %0 = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %0)
  %1 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %1, i32 5)
  %2 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %2, i32 10)
  %3 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %3, i32 7)
  %4 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %4, i32 7)
  %5 = load %struct.SkipSet** %ss, align 8
  call void @insert(%struct.SkipSet* %5, i32 6)
  %6 = load %struct.SkipSet** %ss, align 8
  %call1 = call i32 @contains(%struct.SkipSet* %6, i32 7)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %7)
  %8 = load %struct.SkipSet** %ss, align 8
  call void @delete(%struct.SkipSet* %8, i32 7)
  %9 = load %struct.SkipSet** %ss, align 8
  call void @print_skipset(%struct.SkipSet* %9)
  %10 = load %struct.SkipSet** %ss, align 8
  %call3 = call i32 @contains(%struct.SkipSet* %10, i32 7)
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %if.end7, label %if.then5

if.then5:                                         ; preds = %if.end
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  ret i32 0
}
