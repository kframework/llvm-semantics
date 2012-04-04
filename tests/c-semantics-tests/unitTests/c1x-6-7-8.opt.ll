; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x-6-7-8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i32], i32 }
%struct.anon.0 = type { [3 x i32], i32 }
%struct.anon.1 = type { [3 x i32], i32 }
%struct.anon.2 = type { [3 x i32], i32 }

@sec26.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [15 x i8] c"y1[%d][%d]=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"z1[%d][%d]=%d\0A\00", align 1
@sec28.w1 = private unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@sec28.w2 = private unnamed_addr constant [2 x %struct.anon.0] [%struct.anon.0 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.0 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str2 = private unnamed_addr constant [17 x i8] c"w1[%d].a[%d]=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"q1[%d][%d][%d]=%d\0A\00", align 1
@sec31.a2 = private unnamed_addr constant [2 x i32] [i32 1, i32 2], align 4
@sec31.b2 = private unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str4 = private unnamed_addr constant [11 x i8] c"a1[%d]=%d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"b1[%d]=%d\0A\00", align 1
@sec32.t2 = private unnamed_addr constant [3 x i8] c"abc", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"s1[%d]=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [11 x i8] c"t1[%d]=%d\0A\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"member one\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"member two\00", align 1
@sec35.w1 = private unnamed_addr constant [2 x %struct.anon.1] [%struct.anon.1 { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon.1 { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str12 = private unnamed_addr constant [15 x i8] c"w1[%d][%d]=%d\0A\00", align 1
@sec36.a2 = private unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16

define i32 @sec26() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc15 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv19 to i32
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.cond1, label %return

for.cond1:                                        ; preds = %for.cond, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %1, 3
  br i1 %cmp2, label %for.body3, label %for.inc15

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %2 = load i32* %arrayidx5, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %0, i32 %1, i32 %2) nounwind
  %arrayidx13 = getelementptr inbounds [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %3 = load i32* %arrayidx13, align 4, !tbaa !0
  %cmp14 = icmp eq i32 %2, %3
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp14, label %for.cond1, label %return

for.inc15:                                        ; preds = %for.cond1
  %indvars.iv.next20 = add i64 %indvars.iv19, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body3
  %retval.0 = phi i32 [ 1, %for.body3 ], [ 0, %for.cond ]
  ret i32 %retval.0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @sec27() nounwind uwtable {
entry:
  %z1 = alloca [4 x [3 x i32]], align 16
  %z2 = alloca [4 x [3 x i32]], align 16
  %0 = bitcast [4 x [3 x i32]]* %z1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 16, i1 false)
  %1 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 0, i64 0
  store i32 1, i32* %1, align 16
  %2 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 1, i64 0
  store i32 2, i32* %2, align 4
  %3 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 2, i64 0
  store i32 3, i32* %3, align 8
  %4 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 3, i64 0
  store i32 4, i32* %4, align 4
  %5 = bitcast [4 x [3 x i32]]* %z2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 48, i32 16, i1 false)
  %6 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 0, i64 0
  store i32 1, i32* %6, align 16
  %7 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 1, i64 0
  store i32 2, i32* %7, align 4
  %8 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 2, i64 0
  store i32 3, i32* %8, align 8
  %9 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 3, i64 0
  store i32 4, i32* %9, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc15 ], [ 0, %entry ]
  %10 = trunc i64 %indvars.iv19 to i32
  %cmp = icmp slt i32 %10, 4
  br i1 %cmp, label %for.cond1, label %return

for.cond1:                                        ; preds = %for.cond, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond ]
  %11 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %11, 3
  br i1 %cmp2, label %for.body3, label %for.inc15

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [4 x [3 x i32]]* %z1, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %12 = load i32* %arrayidx5, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 %10, i32 %11, i32 %12) nounwind
  %arrayidx13 = getelementptr inbounds [4 x [3 x i32]]* %z2, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %13 = load i32* %arrayidx13, align 4, !tbaa !0
  %cmp14 = icmp eq i32 %12, %13
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp14, label %for.cond1, label %return

for.inc15:                                        ; preds = %for.cond1
  %indvars.iv.next20 = add i64 %indvars.iv19, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body3
  %retval.0 = phi i32 [ 1, %for.body3 ], [ 0, %for.cond ]
  ret i32 %retval.0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @sec28() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc25, %entry
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc25 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv29 to i32
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.cond1.preheader, label %return

for.cond1.preheader:                              ; preds = %for.cond
  %b = getelementptr inbounds [2 x %struct.anon]* @sec28.w1, i64 0, i64 %indvars.iv29, i32 1
  %b21 = getelementptr inbounds [2 x %struct.anon.0]* @sec28.w2, i64 0, i64 %indvars.iv29, i32 1
  br label %for.cond1

for.cond1:                                        ; preds = %if.end, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.cond1.preheader ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %1, 3
  br i1 %cmp2, label %for.body3, label %for.inc25

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [2 x %struct.anon]* @sec28.w1, i64 0, i64 %indvars.iv29, i32 0, i64 %indvars.iv
  %2 = load i32* %arrayidx5, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %0, i32 %1, i32 %2) nounwind
  %arrayidx15 = getelementptr inbounds [2 x %struct.anon.0]* @sec28.w2, i64 0, i64 %indvars.iv29, i32 0, i64 %indvars.iv
  %3 = load i32* %arrayidx15, align 4, !tbaa !0
  %cmp16 = icmp eq i32 %2, %3
  br i1 %cmp16, label %if.end, label %return

if.end:                                           ; preds = %for.body3
  %4 = load i32* %b, align 4, !tbaa !0
  %5 = load i32* %b21, align 4, !tbaa !0
  %cmp22 = icmp eq i32 %4, %5
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp22, label %for.cond1, label %return

for.inc25:                                        ; preds = %for.cond1
  %indvars.iv.next30 = add i64 %indvars.iv29, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %if.end, %for.body3
  %retval.0 = phi i32 [ 1, %for.body3 ], [ 1, %if.end ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @sec29() nounwind uwtable {
entry:
  %q1 = alloca [4 x [3 x [2 x i16]]], align 16
  %q2 = alloca [4 x [3 x [2 x i16]]], align 16
  %q3 = alloca [4 x [3 x [2 x i16]]], align 16
  %0 = bitcast [4 x [3 x [2 x i16]]]* %q1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 16, i1 false)
  %1 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %1, align 16
  %2 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %2, align 4
  %3 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %3, align 2
  %4 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %4, align 8
  %5 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %5, align 2
  %6 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %6, align 4
  %7 = bitcast [4 x [3 x [2 x i16]]]* %q2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 48, i32 16, i1 false)
  %8 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %8, align 16
  %9 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %9, align 4
  %10 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %10, align 2
  %11 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %11, align 8
  %12 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %12, align 2
  %13 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %13, align 4
  %14 = bitcast [4 x [3 x [2 x i16]]]* %q3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 48, i32 16, i1 false)
  %15 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %15, align 16
  %16 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %16, align 4
  %17 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %17, align 2
  %18 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %18, align 8
  %19 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %19, align 2
  %20 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %20, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.inc48 ], [ 0, %entry ]
  %21 = trunc i64 %indvars.iv54 to i32
  %cmp = icmp slt i32 %21, 4
  br i1 %cmp, label %for.cond1, label %return

for.cond1:                                        ; preds = %for.cond, %for.inc45
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc45 ], [ 0, %for.cond ]
  %22 = trunc i64 %indvars.iv52 to i32
  %cmp2 = icmp slt i32 %22, 3
  br i1 %cmp2, label %for.cond4, label %for.inc48

for.cond4:                                        ; preds = %for.cond1, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.cond1 ]
  %23 = trunc i64 %indvars.iv to i32
  %cmp5 = icmp slt i32 %23, 2
  br i1 %cmp5, label %for.body6, label %for.inc45

for.body6:                                        ; preds = %for.cond4
  %arrayidx10 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 %indvars.iv54, i64 %indvars.iv52, i64 %indvars.iv
  %24 = load i16* %arrayidx10, align 2, !tbaa !3
  %conv = sext i16 %24 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %21, i32 %22, i32 %23, i32 %conv) nounwind
  %arrayidx23 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 %indvars.iv54, i64 %indvars.iv52, i64 %indvars.iv
  %25 = load i16* %arrayidx23, align 2, !tbaa !3
  %cmp25 = icmp eq i16 %24, %25
  br i1 %cmp25, label %if.end, label %return

if.end:                                           ; preds = %for.body6
  %arrayidx39 = getelementptr inbounds [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 %indvars.iv54, i64 %indvars.iv52, i64 %indvars.iv
  %26 = load i16* %arrayidx39, align 2, !tbaa !3
  %cmp41 = icmp eq i16 %24, %26
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp41, label %for.cond4, label %return

for.inc45:                                        ; preds = %for.cond4
  %indvars.iv.next53 = add i64 %indvars.iv52, 1
  br label %for.cond1

for.inc48:                                        ; preds = %for.cond1
  %indvars.iv.next55 = add i64 %indvars.iv54, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %if.end, %for.body6
  %retval.0 = phi i32 [ 1, %for.body6 ], [ 1, %if.end ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @sec31() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv24 to i32
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.cond7

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [2 x i32]* @sec31.a2, i64 0, i64 %indvars.iv24
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %0, i32 %1) nounwind
  %arrayidx4 = getelementptr inbounds [2 x i32]* @sec31.a2, i64 0, i64 %indvars.iv24
  %2 = load i32* %arrayidx4, align 4, !tbaa !0
  %cmp5 = icmp eq i32 %1, %2
  %indvars.iv.next25 = add i64 %indvars.iv24, 1
  br i1 %cmp5, label %for.cond, label %return

for.cond7:                                        ; preds = %for.cond, %for.body9
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body9 ], [ 0, %for.cond ]
  %3 = trunc i64 %indvars.iv to i32
  %cmp8 = icmp slt i32 %3, 3
  br i1 %cmp8, label %for.body9, label %return

for.body9:                                        ; preds = %for.cond7
  %arrayidx11 = getelementptr inbounds [3 x i32]* @sec31.b2, i64 0, i64 %indvars.iv
  %4 = load i32* %arrayidx11, align 4, !tbaa !0
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), i32 %3, i32 %4) nounwind
  %arrayidx16 = getelementptr inbounds [3 x i32]* @sec31.b2, i64 0, i64 %indvars.iv
  %5 = load i32* %arrayidx16, align 4, !tbaa !0
  %cmp17 = icmp eq i32 %4, %5
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp17, label %for.cond7, label %return

return:                                           ; preds = %for.body, %for.cond7, %for.body9
  %retval.0 = phi i32 [ 0, %for.cond7 ], [ 1, %for.body9 ], [ 1, %for.body ]
  ret i32 %retval.0
}

define i32 @sec32() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %if.end ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv42 to i32
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.cond20

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42
  %1 = load i8* %arrayidx, align 1, !tbaa !1
  %conv = sext i8 %1 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i32 %0, i32 %conv) nounwind
  %arrayidx5 = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42
  %2 = load i8* %arrayidx5, align 1, !tbaa !1
  %cmp7 = icmp eq i8 %1, %2
  br i1 %cmp7, label %if.end, label %return

if.end:                                           ; preds = %for.body
  %arrayidx13 = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42
  %3 = load i8* %arrayidx13, align 1, !tbaa !1
  %cmp15 = icmp eq i8 %1, %3
  %indvars.iv.next43 = add i64 %indvars.iv42, 1
  br i1 %cmp15, label %for.cond, label %return

for.cond20:                                       ; preds = %for.cond, %for.body23
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body23 ], [ 0, %for.cond ]
  %4 = trunc i64 %indvars.iv to i32
  %cmp21 = icmp slt i32 %4, 3
  br i1 %cmp21, label %for.body23, label %return

for.body23:                                       ; preds = %for.cond20
  %arrayidx25 = getelementptr inbounds [3 x i8]* @sec32.t2, i64 0, i64 %indvars.iv
  %5 = load i8* %arrayidx25, align 1, !tbaa !1
  %conv26 = sext i8 %5 to i32
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str8, i64 0, i64 0), i32 %4, i32 %conv26) nounwind
  %arrayidx32 = getelementptr inbounds [3 x i8]* @sec32.t2, i64 0, i64 %indvars.iv
  %6 = load i8* %arrayidx32, align 1, !tbaa !1
  %cmp34 = icmp eq i8 %5, %6
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp34, label %for.cond20, label %return

return:                                           ; preds = %if.end, %for.body, %for.cond20, %for.body23
  %retval.0 = phi i32 [ 0, %for.cond20 ], [ 1, %for.body23 ], [ 1, %for.body ], [ 1, %if.end ]
  ret i32 %retval.0
}

define i32 @sec33() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0))
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0))
  ret i32 0
}

define i32 @sec34() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @sec35() nounwind uwtable {
entry:
  %w2 = alloca [2 x %struct.anon.2], align 16
  %0 = bitcast [2 x %struct.anon.2]* %w2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 16, i1 false)
  %arrayidx1 = getelementptr inbounds [2 x %struct.anon.2]* %w2, i64 0, i64 0, i32 0, i64 0
  store i32 1, i32* %arrayidx1, align 16, !tbaa !0
  %arrayidx4 = getelementptr inbounds [2 x %struct.anon.2]* %w2, i64 0, i64 1, i32 0, i64 0
  store i32 2, i32* %arrayidx4, align 16, !tbaa !0
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %entry
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc23 ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv27 to i32
  %cmp = icmp slt i32 %1, 2
  br i1 %cmp, label %for.cond5, label %return

for.cond5:                                        ; preds = %for.cond, %for.body7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ 0, %for.cond ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp6 = icmp slt i32 %2, 3
  br i1 %cmp6, label %for.body7, label %for.inc23

for.body7:                                        ; preds = %for.cond5
  %arrayidx11 = getelementptr inbounds [2 x %struct.anon.1]* @sec35.w1, i64 0, i64 %indvars.iv27, i32 0, i64 %indvars.iv
  %3 = load i32* %arrayidx11, align 4, !tbaa !0
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i32 %1, i32 %2, i32 %3) nounwind
  %arrayidx21 = getelementptr inbounds [2 x %struct.anon.2]* %w2, i64 0, i64 %indvars.iv27, i32 0, i64 %indvars.iv
  %4 = load i32* %arrayidx21, align 4, !tbaa !0
  %cmp22 = icmp eq i32 %3, %4
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp22, label %for.cond5, label %return

for.inc23:                                        ; preds = %for.cond5
  %indvars.iv.next28 = add i64 %indvars.iv27, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body7
  %retval.0 = phi i32 [ 1, %for.body7 ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @sec36() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 20
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [20 x i32]* @sec36.a2, i64 0, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %0, i32 %1) nounwind
  %arrayidx4 = getelementptr inbounds [20 x i32]* @sec36.a2, i64 0, i64 %indvars.iv
  %2 = load i32* %arrayidx4, align 4, !tbaa !0
  %cmp5 = icmp eq i32 %1, %2
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp5, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @sec38() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %w2.i = alloca [2 x %struct.anon.2], align 16
  %z1.i = alloca [4 x [3 x i32]], align 16
  %z2.i = alloca [4 x [3 x i32]], align 16
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc15.i, %entry
  %indvars.iv19.i = phi i64 [ %indvars.iv.next20.i, %for.inc15.i ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv19.i to i32
  %cmp.i = icmp slt i32 %0, 4
  br i1 %cmp.i, label %for.cond1.i, label %if.end

for.cond1.i:                                      ; preds = %for.cond.i, %for.body3.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body3.i ], [ 0, %for.cond.i ]
  %1 = trunc i64 %indvars.iv.i to i32
  %cmp2.i = icmp slt i32 %1, 3
  br i1 %cmp2.i, label %for.body3.i, label %for.inc15.i

for.body3.i:                                      ; preds = %for.cond1.i
  %arrayidx5.i = getelementptr inbounds [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvars.iv19.i, i64 %indvars.iv.i
  %2 = load i32* %arrayidx5.i, align 4, !tbaa !0
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %0, i32 %1, i32 %2) nounwind
  %arrayidx13.i = getelementptr inbounds [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvars.iv19.i, i64 %indvars.iv.i
  %3 = load i32* %arrayidx13.i, align 4, !tbaa !0
  %cmp14.i = icmp eq i32 %2, %3
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  br i1 %cmp14.i, label %for.cond1.i, label %return

for.inc15.i:                                      ; preds = %for.cond1.i
  %indvars.iv.next20.i = add i64 %indvars.iv19.i, 1
  br label %for.cond.i

if.end:                                           ; preds = %for.cond.i
  %4 = bitcast [4 x [3 x i32]]* %z1.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %4) nounwind
  %5 = bitcast [4 x [3 x i32]]* %z2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %5) nounwind
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 48, i32 16, i1 false) nounwind
  %6 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 0, i64 0
  store i32 1, i32* %6, align 16
  %7 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 1, i64 0
  store i32 2, i32* %7, align 4
  %8 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 2, i64 0
  store i32 3, i32* %8, align 8
  %9 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 3, i64 0
  store i32 4, i32* %9, align 4
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 48, i32 16, i1 false) nounwind
  %10 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 0, i64 0
  store i32 1, i32* %10, align 16
  %11 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 1, i64 0
  store i32 2, i32* %11, align 4
  %12 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 2, i64 0
  store i32 3, i32* %12, align 8
  %13 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 3, i64 0
  store i32 4, i32* %13, align 4
  br label %for.cond.i43

for.cond.i43:                                     ; preds = %for.inc15.i54, %if.end
  %indvars.iv19.i41 = phi i64 [ %indvars.iv.next20.i53, %for.inc15.i54 ], [ 0, %if.end ]
  %14 = trunc i64 %indvars.iv19.i41 to i32
  %cmp.i42 = icmp slt i32 %14, 4
  br i1 %cmp.i42, label %for.cond1.i46, label %for.cond.i57

for.cond1.i46:                                    ; preds = %for.cond.i43, %for.body3.i52
  %indvars.iv.i44 = phi i64 [ %indvars.iv.next.i51, %for.body3.i52 ], [ 0, %for.cond.i43 ]
  %15 = trunc i64 %indvars.iv.i44 to i32
  %cmp2.i45 = icmp slt i32 %15, 3
  br i1 %cmp2.i45, label %for.body3.i52, label %for.inc15.i54

for.body3.i52:                                    ; preds = %for.cond1.i46
  %arrayidx5.i47 = getelementptr inbounds [4 x [3 x i32]]* %z1.i, i64 0, i64 %indvars.iv19.i41, i64 %indvars.iv.i44
  %16 = load i32* %arrayidx5.i47, align 4, !tbaa !0
  %call.i48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 %14, i32 %15, i32 %16) nounwind
  %arrayidx13.i49 = getelementptr inbounds [4 x [3 x i32]]* %z2.i, i64 0, i64 %indvars.iv19.i41, i64 %indvars.iv.i44
  %17 = load i32* %arrayidx13.i49, align 4, !tbaa !0
  %cmp14.i50 = icmp eq i32 %16, %17
  %indvars.iv.next.i51 = add i64 %indvars.iv.i44, 1
  br i1 %cmp14.i50, label %for.cond1.i46, label %return

for.inc15.i54:                                    ; preds = %for.cond1.i46
  %indvars.iv.next20.i53 = add i64 %indvars.iv19.i41, 1
  br label %for.cond.i43

for.cond.i57:                                     ; preds = %for.cond.i43, %for.inc25.i
  %indvars.iv29.i = phi i64 [ %indvars.iv.next30.i, %for.inc25.i ], [ 0, %for.cond.i43 ]
  %18 = trunc i64 %indvars.iv29.i to i32
  %cmp.i56 = icmp slt i32 %18, 2
  br i1 %cmp.i56, label %for.cond1.preheader.i, label %if.end8

for.cond1.preheader.i:                            ; preds = %for.cond.i57
  %b.i = getelementptr inbounds [2 x %struct.anon]* @sec28.w1, i64 0, i64 %indvars.iv29.i, i32 1
  %b21.i = getelementptr inbounds [2 x %struct.anon.0]* @sec28.w2, i64 0, i64 %indvars.iv29.i, i32 1
  br label %for.cond1.i60

for.cond1.i60:                                    ; preds = %if.end.i, %for.cond1.preheader.i
  %indvars.iv.i58 = phi i64 [ %indvars.iv.next.i64, %if.end.i ], [ 0, %for.cond1.preheader.i ]
  %19 = trunc i64 %indvars.iv.i58 to i32
  %cmp2.i59 = icmp slt i32 %19, 3
  br i1 %cmp2.i59, label %for.body3.i63, label %for.inc25.i

for.body3.i63:                                    ; preds = %for.cond1.i60
  %arrayidx5.i61 = getelementptr inbounds [2 x %struct.anon]* @sec28.w1, i64 0, i64 %indvars.iv29.i, i32 0, i64 %indvars.iv.i58
  %20 = load i32* %arrayidx5.i61, align 4, !tbaa !0
  %call.i62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %18, i32 %19, i32 %20) nounwind
  %arrayidx15.i = getelementptr inbounds [2 x %struct.anon.0]* @sec28.w2, i64 0, i64 %indvars.iv29.i, i32 0, i64 %indvars.iv.i58
  %21 = load i32* %arrayidx15.i, align 4, !tbaa !0
  %cmp16.i = icmp eq i32 %20, %21
  br i1 %cmp16.i, label %if.end.i, label %return

if.end.i:                                         ; preds = %for.body3.i63
  %22 = load i32* %b.i, align 4, !tbaa !0
  %23 = load i32* %b21.i, align 4, !tbaa !0
  %cmp22.i = icmp eq i32 %22, %23
  %indvars.iv.next.i64 = add i64 %indvars.iv.i58, 1
  br i1 %cmp22.i, label %for.cond1.i60, label %return

for.inc25.i:                                      ; preds = %for.cond1.i60
  %indvars.iv.next30.i = add i64 %indvars.iv29.i, 1
  br label %for.cond.i57

if.end8:                                          ; preds = %for.cond.i57
  %call9 = call i32 @sec29()
  %tobool10 = icmp eq i32 %call9, 0
  br i1 %tobool10, label %for.cond.i67, label %return

for.cond.i67:                                     ; preds = %if.end8, %for.body.i
  %indvars.iv24.i = phi i64 [ %indvars.iv.next25.i, %for.body.i ], [ 0, %if.end8 ]
  %24 = trunc i64 %indvars.iv24.i to i32
  %cmp.i66 = icmp slt i32 %24, 2
  br i1 %cmp.i66, label %for.body.i, label %for.cond7.i

for.body.i:                                       ; preds = %for.cond.i67
  %arrayidx.i = getelementptr inbounds [2 x i32]* @sec31.a2, i64 0, i64 %indvars.iv24.i
  %25 = load i32* %arrayidx.i, align 4, !tbaa !0
  %call.i68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %24, i32 %25) nounwind
  %arrayidx4.i = getelementptr inbounds [2 x i32]* @sec31.a2, i64 0, i64 %indvars.iv24.i
  %26 = load i32* %arrayidx4.i, align 4, !tbaa !0
  %cmp5.i = icmp eq i32 %25, %26
  %indvars.iv.next25.i = add i64 %indvars.iv24.i, 1
  br i1 %cmp5.i, label %for.cond.i67, label %return

for.cond7.i:                                      ; preds = %for.cond.i67, %for.body9.i
  %indvars.iv.i69 = phi i64 [ %indvars.iv.next.i70, %for.body9.i ], [ 0, %for.cond.i67 ]
  %27 = trunc i64 %indvars.iv.i69 to i32
  %cmp8.i = icmp slt i32 %27, 3
  br i1 %cmp8.i, label %for.body9.i, label %for.cond.i73

for.body9.i:                                      ; preds = %for.cond7.i
  %arrayidx11.i = getelementptr inbounds [3 x i32]* @sec31.b2, i64 0, i64 %indvars.iv.i69
  %28 = load i32* %arrayidx11.i, align 4, !tbaa !0
  %call12.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), i32 %27, i32 %28) nounwind
  %arrayidx16.i = getelementptr inbounds [3 x i32]* @sec31.b2, i64 0, i64 %indvars.iv.i69
  %29 = load i32* %arrayidx16.i, align 4, !tbaa !0
  %cmp17.i = icmp eq i32 %28, %29
  %indvars.iv.next.i70 = add i64 %indvars.iv.i69, 1
  br i1 %cmp17.i, label %for.cond7.i, label %return

for.cond.i73:                                     ; preds = %for.cond7.i, %if.end.i79
  %indvars.iv42.i = phi i64 [ %indvars.iv.next43.i, %if.end.i79 ], [ 0, %for.cond7.i ]
  %30 = trunc i64 %indvars.iv42.i to i32
  %cmp.i72 = icmp slt i32 %30, 4
  br i1 %cmp.i72, label %for.body.i77, label %for.cond20.i

for.body.i77:                                     ; preds = %for.cond.i73
  %arrayidx.i74 = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42.i
  %31 = load i8* %arrayidx.i74, align 1, !tbaa !1
  %conv.i = sext i8 %31 to i32
  %call.i75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i32 %30, i32 %conv.i) nounwind
  %arrayidx5.i76 = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42.i
  %32 = load i8* %arrayidx5.i76, align 1, !tbaa !1
  %cmp7.i = icmp eq i8 %31, %32
  br i1 %cmp7.i, label %if.end.i79, label %return

if.end.i79:                                       ; preds = %for.body.i77
  %arrayidx13.i78 = getelementptr inbounds [4 x i8]* @.str6, i64 0, i64 %indvars.iv42.i
  %33 = load i8* %arrayidx13.i78, align 1, !tbaa !1
  %cmp15.i = icmp eq i8 %31, %33
  %indvars.iv.next43.i = add i64 %indvars.iv42.i, 1
  br i1 %cmp15.i, label %for.cond.i73, label %return

for.cond20.i:                                     ; preds = %for.cond.i73, %for.body23.i
  %indvars.iv.i80 = phi i64 [ %indvars.iv.next.i81, %for.body23.i ], [ 0, %for.cond.i73 ]
  %34 = trunc i64 %indvars.iv.i80 to i32
  %cmp21.i = icmp slt i32 %34, 3
  br i1 %cmp21.i, label %for.body23.i, label %if.end20

for.body23.i:                                     ; preds = %for.cond20.i
  %arrayidx25.i = getelementptr inbounds [3 x i8]* @sec32.t2, i64 0, i64 %indvars.iv.i80
  %35 = load i8* %arrayidx25.i, align 1, !tbaa !1
  %conv26.i = sext i8 %35 to i32
  %call27.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str8, i64 0, i64 0), i32 %34, i32 %conv26.i) nounwind
  %arrayidx32.i = getelementptr inbounds [3 x i8]* @sec32.t2, i64 0, i64 %indvars.iv.i80
  %36 = load i8* %arrayidx32.i, align 1, !tbaa !1
  %cmp34.i = icmp eq i8 %35, %36
  %indvars.iv.next.i81 = add i64 %indvars.iv.i80, 1
  br i1 %cmp34.i, label %for.cond20.i, label %return

if.end20:                                         ; preds = %for.cond20.i
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0)) nounwind
  %puts3.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0)) nounwind
  %37 = bitcast [2 x %struct.anon.2]* %w2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %37) nounwind
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 32, i32 16, i1 false) nounwind
  %arrayidx1.i = getelementptr inbounds [2 x %struct.anon.2]* %w2.i, i64 0, i64 0, i32 0, i64 0
  store i32 1, i32* %arrayidx1.i, align 16, !tbaa !0
  %arrayidx4.i83 = getelementptr inbounds [2 x %struct.anon.2]* %w2.i, i64 0, i64 1, i32 0, i64 0
  store i32 2, i32* %arrayidx4.i83, align 16, !tbaa !0
  br label %for.cond.i85

for.cond.i85:                                     ; preds = %for.inc23.i, %if.end20
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %for.inc23.i ], [ 0, %if.end20 ]
  %38 = trunc i64 %indvars.iv27.i to i32
  %cmp.i84 = icmp slt i32 %38, 2
  br i1 %cmp.i84, label %for.cond5.i, label %for.cond.i94

for.cond5.i:                                      ; preds = %for.cond.i85, %for.body7.i
  %indvars.iv.i86 = phi i64 [ %indvars.iv.next.i90, %for.body7.i ], [ 0, %for.cond.i85 ]
  %39 = trunc i64 %indvars.iv.i86 to i32
  %cmp6.i = icmp slt i32 %39, 3
  br i1 %cmp6.i, label %for.body7.i, label %for.inc23.i

for.body7.i:                                      ; preds = %for.cond5.i
  %arrayidx11.i87 = getelementptr inbounds [2 x %struct.anon.1]* @sec35.w1, i64 0, i64 %indvars.iv27.i, i32 0, i64 %indvars.iv.i86
  %40 = load i32* %arrayidx11.i87, align 4, !tbaa !0
  %call.i88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i32 %38, i32 %39, i32 %40) nounwind
  %arrayidx21.i = getelementptr inbounds [2 x %struct.anon.2]* %w2.i, i64 0, i64 %indvars.iv27.i, i32 0, i64 %indvars.iv.i86
  %41 = load i32* %arrayidx21.i, align 4, !tbaa !0
  %cmp22.i89 = icmp eq i32 %40, %41
  %indvars.iv.next.i90 = add i64 %indvars.iv.i86, 1
  br i1 %cmp22.i89, label %for.cond5.i, label %return

for.inc23.i:                                      ; preds = %for.cond5.i
  %indvars.iv.next28.i = add i64 %indvars.iv27.i, 1
  br label %for.cond.i85

for.cond.i94:                                     ; preds = %for.cond.i85, %for.body.i100
  %indvars.iv.i92 = phi i64 [ %indvars.iv.next.i99, %for.body.i100 ], [ 0, %for.cond.i85 ]
  %42 = trunc i64 %indvars.iv.i92 to i32
  %cmp.i93 = icmp slt i32 %42, 20
  br i1 %cmp.i93, label %for.body.i100, label %return

for.body.i100:                                    ; preds = %for.cond.i94
  %arrayidx.i95 = getelementptr inbounds [20 x i32]* @sec36.a2, i64 0, i64 %indvars.iv.i92
  %43 = load i32* %arrayidx.i95, align 4, !tbaa !0
  %call.i96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %42, i32 %43) nounwind
  %arrayidx4.i97 = getelementptr inbounds [20 x i32]* @sec36.a2, i64 0, i64 %indvars.iv.i92
  %44 = load i32* %arrayidx4.i97, align 4, !tbaa !0
  %cmp5.i98 = icmp eq i32 %43, %44
  %indvars.iv.next.i99 = add i64 %indvars.iv.i92, 1
  br i1 %cmp5.i98, label %for.cond.i94, label %return

return:                                           ; preds = %for.body3.i, %for.body3.i52, %if.end.i, %for.body3.i63, %for.body.i, %for.body9.i, %if.end.i79, %for.body.i77, %for.body23.i, %for.body7.i, %for.body.i100, %for.cond.i94, %if.end8
  %retval.0 = phi i32 [ 29, %if.end8 ], [ 36, %for.body.i100 ], [ 0, %for.cond.i94 ], [ 35, %for.body7.i ], [ 32, %for.body23.i ], [ 32, %for.body.i77 ], [ 32, %if.end.i79 ], [ 31, %for.body9.i ], [ 31, %for.body.i ], [ 28, %for.body3.i63 ], [ 28, %if.end.i ], [ 27, %for.body3.i52 ], [ 26, %for.body3.i ]
  ret i32 %retval.0
}

declare i32 @puts(i8* nocapture) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
