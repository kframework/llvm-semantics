; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-24.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@errors = internal global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"varargs9\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c" %s: n[%d] = %d expected %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"varargs8\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"varargs7\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"varargs6\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"varargs5\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"varargs4\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"varargs3\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"varargs2\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c"varargs1\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"varargs0\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @varargs0(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, ...)* @varargs1(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, ...)* @varargs2(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, ...)* @varargs3(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, ...)* @varargs4(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, ...)* @varargs5(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, ...)* @varargs6(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs7(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs8(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  call void (i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ...)* @varargs9(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  %0 = load i32* @errors, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

define internal void @varargs0(i32 %q0, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp sle i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %2, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  %arraydecay6 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0), i32* %arraydecay6)
  ret void
}

define internal void @varargs1(i32 %q0, i32 %q1, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp sle i32 %2, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay3, i32
  %4 = load i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %3, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  %arraydecay7 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0), i32* %arraydecay7)
  ret void
}

define internal void @varargs2(i32 %q0, i32 %q1, i32 %q2, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  store i32 3, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32* %i, align 4
  %cmp = icmp sle i32 %3, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay4, i32
  %5 = load i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %4, i32* %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay67 = bitcast %struct.__va_list_tag* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  %arraydecay8 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i32* %arraydecay8)
  ret void
}

define internal void @varargs3(i32 %q0, i32 %q1, i32 %q2, i32 %q3, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  store i32 4, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32* %i, align 4
  %cmp = icmp sle i32 %4, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay5, i32
  %6 = load i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %5, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  %arraydecay9 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0), i32* %arraydecay9)
  ret void
}

define internal void @varargs4(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  store i32 5, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32* %i, align 4
  %cmp = icmp sle i32 %5, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay6, i32
  %7 = load i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %6, i32* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay89 = bitcast %struct.__va_list_tag* %arraydecay8 to i8*
  call void @llvm.va_end(i8* %arraydecay89)
  %arraydecay10 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0), i32* %arraydecay10)
  ret void
}

define internal void @varargs5(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  %5 = load i32* %q5.addr, align 4
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %5, i32* %arrayidx6, align 4
  store i32 6, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32* %i, align 4
  %cmp = icmp sle i32 %6, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay7, i32
  %8 = load i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %7, i32* %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay910 = bitcast %struct.__va_list_tag* %arraydecay9 to i8*
  call void @llvm.va_end(i8* %arraydecay910)
  %arraydecay11 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32* %arraydecay11)
  ret void
}

define internal void @varargs6(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  %5 = load i32* %q5.addr, align 4
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %5, i32* %arrayidx6, align 4
  %6 = load i32* %q6.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %6, i32* %arrayidx7, align 4
  store i32 7, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i32* %i, align 4
  %cmp = icmp sle i32 %7, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay8, i32
  %9 = load i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %8, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1011 = bitcast %struct.__va_list_tag* %arraydecay10 to i8*
  call void @llvm.va_end(i8* %arraydecay1011)
  %arraydecay12 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32* %arraydecay12)
  ret void
}

define internal void @varargs7(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  %5 = load i32* %q5.addr, align 4
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %5, i32* %arrayidx6, align 4
  %6 = load i32* %q6.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %6, i32* %arrayidx7, align 4
  %7 = load i32* %q7.addr, align 4
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %7, i32* %arrayidx8, align 4
  store i32 8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32* %i, align 4
  %cmp = icmp sle i32 %8, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %9 = va_arg %struct.__va_list_tag* %arraydecay9, i32
  %10 = load i32* %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx10 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %9, i32* %arrayidx10, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1112 = bitcast %struct.__va_list_tag* %arraydecay11 to i8*
  call void @llvm.va_end(i8* %arraydecay1112)
  %arraydecay13 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32* %arraydecay13)
  ret void
}

define internal void @varargs8(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %q8.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  store i32 %q8, i32* %q8.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  %5 = load i32* %q5.addr, align 4
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %5, i32* %arrayidx6, align 4
  %6 = load i32* %q6.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %6, i32* %arrayidx7, align 4
  %7 = load i32* %q7.addr, align 4
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %7, i32* %arrayidx8, align 4
  %8 = load i32* %q8.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %8, i32* %arrayidx9, align 4
  store i32 9, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32* %i, align 4
  %cmp = icmp sle i32 %9, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = va_arg %struct.__va_list_tag* %arraydecay10, i32
  %11 = load i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %10, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1213 = bitcast %struct.__va_list_tag* %arraydecay12 to i8*
  call void @llvm.va_end(i8* %arraydecay1213)
  %arraydecay14 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32* %arraydecay14)
  ret void
}

define internal void @varargs9(i32 %q0, i32 %q1, i32 %q2, i32 %q3, i32 %q4, i32 %q5, i32 %q6, i32 %q7, i32 %q8, i32 %q9, ...) nounwind uwtable {
entry:
  %q0.addr = alloca i32, align 4
  %q1.addr = alloca i32, align 4
  %q2.addr = alloca i32, align 4
  %q3.addr = alloca i32, align 4
  %q4.addr = alloca i32, align 4
  %q5.addr = alloca i32, align 4
  %q6.addr = alloca i32, align 4
  %q7.addr = alloca i32, align 4
  %q8.addr = alloca i32, align 4
  %q9.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %i = alloca i32, align 4
  store i32 %q0, i32* %q0.addr, align 4
  store i32 %q1, i32* %q1.addr, align 4
  store i32 %q2, i32* %q2.addr, align 4
  store i32 %q3, i32* %q3.addr, align 4
  store i32 %q4, i32* %q4.addr, align 4
  store i32 %q5, i32* %q5.addr, align 4
  store i32 %q6, i32* %q6.addr, align 4
  store i32 %q7, i32* %q7.addr, align 4
  store i32 %q8, i32* %q8.addr, align 4
  store i32 %q9, i32* %q9.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %q0.addr, align 4
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i32 0, i64 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32* %q1.addr, align 4
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 1
  store i32 %1, i32* %arrayidx2, align 4
  %2 = load i32* %q2.addr, align 4
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 2
  store i32 %2, i32* %arrayidx3, align 4
  %3 = load i32* %q3.addr, align 4
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 3
  store i32 %3, i32* %arrayidx4, align 4
  %4 = load i32* %q4.addr, align 4
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 4
  store i32 %4, i32* %arrayidx5, align 4
  %5 = load i32* %q5.addr, align 4
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 5
  store i32 %5, i32* %arrayidx6, align 4
  %6 = load i32* %q6.addr, align 4
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 6
  store i32 %6, i32* %arrayidx7, align 4
  %7 = load i32* %q7.addr, align 4
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 7
  store i32 %7, i32* %arrayidx8, align 4
  %8 = load i32* %q8.addr, align 4
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 8
  store i32 %8, i32* %arrayidx9, align 4
  %9 = load i32* %q9.addr, align 4
  %arrayidx10 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 9
  store i32 %9, i32* %arrayidx10, align 4
  store i32 10, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i32* %i, align 4
  %cmp = icmp sle i32 %10, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = va_arg %struct.__va_list_tag* %arraydecay11, i32
  %12 = load i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx12 = getelementptr inbounds [11 x i32]* %n, i32 0, i64 %idxprom
  store i32 %11, i32* %arrayidx12, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1314 = bitcast %struct.__va_list_tag* %arraydecay13 to i8*
  call void @llvm.va_end(i8* %arraydecay1314)
  %arraydecay15 = getelementptr inbounds [11 x i32]* %n, i32 0, i32 0
  call void @verify(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32* %arraydecay15)
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define internal void @verify(i8* %tcase, i32* %n) nounwind uwtable {
entry:
  %tcase.addr = alloca i8*, align 8
  %n.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i8* %tcase, i8** %tcase.addr, align 8
  store i32* %n, i32** %n.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i32** %n.addr, align 8
  %arrayidx = getelementptr inbounds i32* %2, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %4 = load i32* %i, align 4
  %cmp1 = icmp ne i32 %3, %4
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i8** %tcase.addr, align 8
  %6 = load i32* %i, align 4
  %7 = load i32* %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %8 = load i32** %n.addr, align 8
  %arrayidx3 = getelementptr inbounds i32* %8, i64 %idxprom2
  %9 = load i32* %arrayidx3, align 4
  %10 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i8* %5, i32 %6, i32 %9, i32 %10)
  %11 = load i32* @errors, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* @errors, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32* %i, align 4
  %inc4 = add nsw i32 %12, 1
  store i32 %inc4, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @printf(i8*, ...)
