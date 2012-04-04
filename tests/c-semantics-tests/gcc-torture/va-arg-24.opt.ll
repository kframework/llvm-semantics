; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-24.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@errors = internal unnamed_addr global i32 0, align 4
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

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (...)* @varargs0(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs1(i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs2(i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs3(i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs4(i32 5, i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs5(i32 6, i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs6(i32 7, i32 8, i32 9, i32 10)
  tail call void (...)* @varargs7(i32 8, i32 9, i32 10)
  tail call void (...)* @varargs8(i32 9, i32 10)
  tail call void (...)* @varargs9(i32 10)
  %0 = load i32* @errors, align 4, !tbaa !0
  %tobool = icmp eq i32 %0, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define internal void @varargs0(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 %0, i32* %arrayidx3, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 %1, i32* %arrayidx3.1, align 8, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 %2, i32* %arrayidx3.2, align 4, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 %3, i32* %arrayidx3.3, align 16, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 %4, i32* %arrayidx3.4, align 4, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %5, i32* %arrayidx3.5, align 8, !tbaa !0
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %6, i32* %arrayidx3.6, align 4, !tbaa !0
  %7 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %7, i32* %arrayidx3.7, align 16, !tbaa !0
  %8 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %8, i32* %arrayidx3.8, align 4, !tbaa !0
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx3.9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %9, i32* %arrayidx3.9, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %10 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %11 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %10, %11
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str10, i64 0, i64 0), i32 %11, i32 %10, i32 %11) nounwind
  %12 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %12, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs1(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 %0, i32* %arrayidx4, align 8, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 %1, i32* %arrayidx4.1, align 4, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 %2, i32* %arrayidx4.2, align 16, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 %3, i32* %arrayidx4.3, align 4, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %4, i32* %arrayidx4.4, align 8, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %5, i32* %arrayidx4.5, align 4, !tbaa !0
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %6, i32* %arrayidx4.6, align 16, !tbaa !0
  %7 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %7, i32* %arrayidx4.7, align 4, !tbaa !0
  %8 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx4.8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %8, i32* %arrayidx4.8, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %9 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %10 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %9, %10
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str9, i64 0, i64 0), i32 %10, i32 %9, i32 %10) nounwind
  %11 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %11, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs2(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 %0, i32* %arrayidx5, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 %1, i32* %arrayidx5.1, align 16, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 %2, i32* %arrayidx5.2, align 4, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %3, i32* %arrayidx5.3, align 8, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %4, i32* %arrayidx5.4, align 4, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %5, i32* %arrayidx5.5, align 16, !tbaa !0
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %6, i32* %arrayidx5.6, align 4, !tbaa !0
  %7 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx5.7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %7, i32* %arrayidx5.7, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %8 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %9 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %8, %9
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str8, i64 0, i64 0), i32 %9, i32 %8, i32 %9) nounwind
  %10 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %10, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs3(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 %0, i32* %arrayidx6, align 16, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 %1, i32* %arrayidx6.1, align 4, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %2, i32* %arrayidx6.2, align 8, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %3, i32* %arrayidx6.3, align 4, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %4, i32* %arrayidx6.4, align 16, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %5, i32* %arrayidx6.5, align 4, !tbaa !0
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx6.6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %6, i32* %arrayidx6.6, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %7 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %8 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %7, %8
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str7, i64 0, i64 0), i32 %8, i32 %7, i32 %8) nounwind
  %9 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %9, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs4(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 %0, i32* %arrayidx7, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %1, i32* %arrayidx7.1, align 8, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %2, i32* %arrayidx7.2, align 4, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %3, i32* %arrayidx7.3, align 16, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %4, i32* %arrayidx7.4, align 4, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx7.5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %5, i32* %arrayidx7.5, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %6 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %7 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %6, %7
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str6, i64 0, i64 0), i32 %7, i32 %6, i32 %7) nounwind
  %8 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %8, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs5(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx6, align 4, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 %0, i32* %arrayidx8, align 8, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx8.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %1, i32* %arrayidx8.1, align 4, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx8.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %2, i32* %arrayidx8.2, align 16, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx8.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %3, i32* %arrayidx8.3, align 4, !tbaa !0
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx8.4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %4, i32* %arrayidx8.4, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %5 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %6 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %5, %6
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str5, i64 0, i64 0), i32 %6, i32 %5, i32 %6) nounwind
  %7 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %7, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs6(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx6, align 4, !tbaa !0
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx7, align 8, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 %0, i32* %arrayidx9, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx9.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %1, i32* %arrayidx9.1, align 16, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx9.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %2, i32* %arrayidx9.2, align 4, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx9.3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %3, i32* %arrayidx9.3, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %4 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %5 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %4, %5
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0), i32 %5, i32 %4, i32 %5) nounwind
  %6 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %6, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs7(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx6, align 4, !tbaa !0
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx7, align 8, !tbaa !0
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx8, align 4, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx10 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 %0, i32* %arrayidx10, align 16, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx10.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %1, i32* %arrayidx10.1, align 4, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx10.2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %2, i32* %arrayidx10.2, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %3 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %4 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %3, %4
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), i32 %4, i32 %3, i32 %4) nounwind
  %5 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %5, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs8(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx6, align 4, !tbaa !0
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx7, align 8, !tbaa !0
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx8, align 4, !tbaa !0
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 8, i32* %arrayidx9, align 16, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx11 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 %0, i32* %arrayidx11, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx11.1 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %1, i32* %arrayidx11.1, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %2 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %3 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %2, %3
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %3, i32 %2, i32 %3) nounwind
  %4 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %4, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

define internal void @varargs9(...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %n = alloca [11 x i32], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx = getelementptr inbounds [11 x i32]* %n, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx2 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 1
  store i32 1, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 2
  store i32 2, i32* %arrayidx3, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 3
  store i32 3, i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 4
  store i32 4, i32* %arrayidx5, align 16, !tbaa !0
  %arrayidx6 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 5
  store i32 5, i32* %arrayidx6, align 4, !tbaa !0
  %arrayidx7 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 6
  store i32 6, i32* %arrayidx7, align 8, !tbaa !0
  %arrayidx8 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 7
  store i32 7, i32* %arrayidx8, align 4, !tbaa !0
  %arrayidx9 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 8
  store i32 8, i32* %arrayidx9, align 16, !tbaa !0
  %arrayidx10 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 9
  store i32 9, i32* %arrayidx10, align 4, !tbaa !0
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %arrayidx12 = getelementptr inbounds [11 x i32]* %n, i64 0, i64 10
  store i32 %0, i32* %arrayidx12, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i.for.body.i_crit_edge, %entry
  %1 = phi i32 [ 0, %entry ], [ %.pre, %for.inc.i.for.body.i_crit_edge ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i.for.body.i_crit_edge ]
  %2 = trunc i64 %indvars.iv.i to i32
  %cmp1.i = icmp eq i32 %1, %2
  br i1 %cmp1.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 %2, i32 %1, i32 %2) nounwind
  %3 = load i32* @errors, align 4, !tbaa !0
  %inc.i = add nsw i32 %3, 1
  store i32 %inc.i, i32* @errors, align 4, !tbaa !0
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 11
  br i1 %exitcond, label %verify.exit, label %for.inc.i.for.body.i_crit_edge

for.inc.i.for.body.i_crit_edge:                   ; preds = %for.inc.i
  %arrayidx.i.phi.trans.insert = getelementptr inbounds [11 x i32]* %n, i64 0, i64 %indvars.iv.next.i
  %.pre = load i32* %arrayidx.i.phi.trans.insert, align 4, !tbaa !0
  br label %for.body.i

verify.exit:                                      ; preds = %for.inc.i
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
