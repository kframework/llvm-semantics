; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-7-8.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i32], i32 }
%struct.div_t = type { i32, i32 }
%union.anon = type { [2 x i32] }

@sec26.y2 = internal unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [15 x i8] c"y1[%d][%d]=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"z1[%d][%d]=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [17 x i8] c"w1[%d].a[%d]=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"q1[%d][%d][%d]=%d\0A\00", align 1
@sec31.b2 = internal unnamed_addr constant [3 x i32] [i32 3, i32 4, i32 5], align 4
@.str4 = private unnamed_addr constant [11 x i8] c"a1[%d]=%d\0A\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"b1[%d]=%d\0A\00", align 1
@sec32.t2 = internal unnamed_addr constant [3 x i8] c"abc", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"s1[%d]=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [11 x i8] c"t1[%d]=%d\0A\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"member one\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"member two\00", align 1
@sec35.w1 = internal unnamed_addr constant [2 x %struct.anon] [%struct.anon { [3 x i32] [i32 1, i32 0, i32 0], i32 0 }, %struct.anon { [3 x i32] [i32 2, i32 0, i32 0], i32 0 }], align 16
@.str12 = private unnamed_addr constant [15 x i8] c"w1[%d][%d]=%d\0A\00", align 1
@sec36.a2 = internal unnamed_addr constant [20 x i32] [i32 1, i32 3, i32 5, i32 7, i32 9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 8, i32 6, i32 4, i32 2, i32 0], align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @sec26() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %indvar4 = phi i64 [ %indvar.next5, %for.inc33 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar4 to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.cond6, label %return

for.cond6:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp8 = icmp slt i32 %storemerge1, 3
  br i1 %cmp8, label %for.body9, label %for.inc33

for.body9:                                        ; preds = %for.cond6
  %arrayidx29 = getelementptr [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvar4, i64 %indvar
  %arrayidx15 = getelementptr [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvar4, i64 %indvar
  %tmp16 = load i32* %arrayidx15, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %storemerge, i32 %storemerge1, i32 %tmp16) nounwind
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp eq i32 %tmp16, %tmp30
  br i1 %cmp31, label %for.inc, label %return

for.inc:                                          ; preds = %for.body9
  %indvar.next = add i64 %indvar, 1
  br label %for.cond6

for.inc33:                                        ; preds = %for.cond6
  %indvar.next5 = add i64 %indvar4, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body9
  %storemerge2 = phi i32 [ 1, %for.body9 ], [ 0, %for.cond ]
  ret i32 %storemerge2
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @sec27() nounwind uwtable {
entry:
  %z1 = alloca [4 x [3 x i32]], align 16
  %z2 = alloca [4 x [3 x i32]], align 16
  %tmp = bitcast [4 x [3 x i32]]* %z1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 48, i32 16, i1 false)
  %0 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 0, i64 0
  store i32 1, i32* %0, align 16
  %1 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 1, i64 0
  store i32 2, i32* %1, align 4
  %2 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 2, i64 0
  store i32 3, i32* %2, align 8
  %3 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 3, i64 0
  store i32 4, i32* %3, align 4
  %tmp2 = bitcast [4 x [3 x i32]]* %z2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 48, i32 16, i1 false)
  %4 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 0, i64 0
  store i32 1, i32* %4, align 16
  %5 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 1, i64 0
  store i32 2, i32* %5, align 4
  %6 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 2, i64 0
  store i32 3, i32* %6, align 8
  %7 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 3, i64 0
  store i32 4, i32* %7, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %indvar5 = phi i64 [ %indvar.next6, %for.inc33 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar5 to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.cond6, label %return

for.cond6:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp8 = icmp slt i32 %storemerge1, 3
  br i1 %cmp8, label %for.body9, label %for.inc33

for.body9:                                        ; preds = %for.cond6
  %arrayidx29 = getelementptr [4 x [3 x i32]]* %z2, i64 0, i64 %indvar5, i64 %indvar
  %arrayidx15 = getelementptr [4 x [3 x i32]]* %z1, i64 0, i64 %indvar5, i64 %indvar
  %tmp16 = load i32* %arrayidx15, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 %storemerge, i32 %storemerge1, i32 %tmp16) nounwind
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp eq i32 %tmp16, %tmp30
  br i1 %cmp31, label %for.inc, label %return

for.inc:                                          ; preds = %for.body9
  %indvar.next = add i64 %indvar, 1
  br label %for.cond6

for.inc33:                                        ; preds = %for.cond6
  %indvar.next6 = add i64 %indvar5, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body9
  %storemerge2 = phi i32 [ 1, %for.body9 ], [ 0, %for.cond ]
  ret i32 %storemerge2
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @sec28() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc47, %entry
  %indvar3 = phi i64 [ %indvar.next4, %for.inc47 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar3 to i32
  %b41 = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3, i32 1
  %b = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3, i32 1
  %cmp = icmp slt i32 %storemerge, 2
  br i1 %cmp, label %for.cond6, label %return

for.cond6:                                        ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp8 = icmp slt i32 %storemerge1, 3
  br i1 %cmp8, label %for.body9, label %for.inc47

for.body9:                                        ; preds = %for.cond6
  %arrayidx31 = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3, i32 0, i64 %indvar
  %arrayidx15 = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3, i32 0, i64 %indvar
  %tmp16 = load i32* %arrayidx15, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %storemerge, i32 %storemerge1, i32 %tmp16) nounwind
  %tmp32 = load i32* %arrayidx31, align 4
  %cmp33 = icmp eq i32 %tmp16, %tmp32
  br i1 %cmp33, label %if.end, label %return

if.end:                                           ; preds = %for.body9
  %tmp37 = load i32* %b, align 4
  %tmp42 = load i32* %b41, align 4
  %cmp43 = icmp eq i32 %tmp37, %tmp42
  br i1 %cmp43, label %for.inc, label %return

for.inc:                                          ; preds = %if.end
  %indvar.next = add i64 %indvar, 1
  br label %for.cond6

for.inc47:                                        ; preds = %for.cond6
  %indvar.next4 = add i64 %indvar3, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %if.end, %for.body9
  %0 = phi i32 [ 1, %for.body9 ], [ 1, %if.end ], [ 0, %for.cond ]
  ret i32 %0
}

define i32 @sec29() nounwind uwtable {
entry:
  %q1 = alloca [4 x [3 x [2 x i16]]], align 16
  %q2 = alloca [4 x [3 x [2 x i16]]], align 16
  %q3 = alloca [4 x [3 x [2 x i16]]], align 16
  %tmp = bitcast [4 x [3 x [2 x i16]]]* %q1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 48, i32 16, i1 false)
  %0 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %0, align 16
  %1 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %1, align 4
  %2 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %2, align 2
  %3 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %3, align 8
  %4 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %4, align 2
  %5 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %5, align 4
  %tmp2 = bitcast [4 x [3 x [2 x i16]]]* %q2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 48, i32 16, i1 false)
  %6 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %6, align 16
  %7 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %7, align 4
  %8 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %8, align 2
  %9 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %9, align 8
  %10 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %10, align 2
  %11 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %11, align 4
  %tmp4 = bitcast [4 x [3 x [2 x i16]]]* %q3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp4, i8 0, i64 48, i32 16, i1 false)
  %12 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 0, i64 0, i64 0
  store i16 1, i16* %12, align 16
  %13 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 1, i64 0, i64 0
  store i16 2, i16* %13, align 4
  %14 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 1, i64 0, i64 1
  store i16 3, i16* %14, align 2
  %15 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 0, i64 0
  store i16 4, i16* %15, align 8
  %16 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 0, i64 1
  store i16 5, i16* %16, align 2
  %17 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 2, i64 1, i64 0
  store i16 6, i16* %17, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc83, %entry
  %indvar6 = phi i64 [ %indvar.next7, %for.inc83 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar6 to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.cond8, label %return

for.cond8:                                        ; preds = %for.cond, %for.inc79
  %indvar8 = phi i64 [ %indvar.next9, %for.inc79 ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar8 to i32
  %cmp10 = icmp slt i32 %storemerge1, 3
  br i1 %cmp10, label %for.cond13, label %for.inc83

for.cond13:                                       ; preds = %for.cond8, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond8 ]
  %arrayidx71 = getelementptr [4 x [3 x [2 x i16]]]* %q3, i64 0, i64 %indvar6, i64 %indvar8, i64 %indvar
  %storemerge2 = trunc i64 %indvar to i32
  %cmp15 = icmp slt i32 %storemerge2, 2
  br i1 %cmp15, label %for.body16, label %for.inc79

for.body16:                                       ; preds = %for.cond13
  %arrayidx26 = getelementptr [4 x [3 x [2 x i16]]]* %q1, i64 0, i64 %indvar6, i64 %indvar8, i64 %indvar
  %arrayidx47 = getelementptr [4 x [3 x [2 x i16]]]* %q2, i64 0, i64 %indvar6, i64 %indvar8, i64 %indvar
  %tmp27 = load i16* %arrayidx26, align 2
  %conv = sext i16 %tmp27 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i64 0, i64 0), i32 %storemerge, i32 %storemerge1, i32 %storemerge2, i32 %conv) nounwind
  %tmp48 = load i16* %arrayidx47, align 2
  %cmp50 = icmp eq i16 %tmp27, %tmp48
  br i1 %cmp50, label %if.end, label %return

if.end:                                           ; preds = %for.body16
  %tmp72 = load i16* %arrayidx71, align 2
  %cmp74 = icmp eq i16 %tmp48, %tmp72
  br i1 %cmp74, label %for.inc, label %return

for.inc:                                          ; preds = %if.end
  %indvar.next = add i64 %indvar, 1
  br label %for.cond13

for.inc79:                                        ; preds = %for.cond13
  %indvar.next9 = add i64 %indvar8, 1
  br label %for.cond8

for.inc83:                                        ; preds = %for.cond8
  %indvar.next7 = add i64 %indvar6, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %if.end, %for.body16
  %18 = phi i32 [ 1, %for.body16 ], [ 1, %if.end ], [ 0, %for.cond ]
  ret i32 %18
}

define i32 @sec31() nounwind uwtable {
entry:
  %a1 = alloca i64, align 8
  %a18 = bitcast i64* %a1 to i8*
  %a2 = alloca i64, align 8
  %a26 = bitcast i64* %a2 to i8*
  store i64 8589934593, i64* %a1, align 8
  store i64 8589934593, i64* %a2, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar4 = phi i64 [ %indvar.next5, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar4 to i32
  %tmp = shl i64 %indvar4, 2
  %cmp = icmp slt i32 %storemerge, 2
  br i1 %cmp, label %for.body, label %for.cond24

for.body:                                         ; preds = %for.cond
  %uglygep9 = getelementptr i8* %a18, i64 %tmp
  %uglygep = getelementptr i8* %a26, i64 %tmp
  %arrayidx = bitcast i8* %uglygep9 to i32*
  %arrayidx18 = bitcast i8* %uglygep to i32*
  %tmp11 = load i32* %arrayidx, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %storemerge, i32 %tmp11) nounwind
  %tmp19 = load i32* %arrayidx18, align 4
  %cmp20 = icmp eq i32 %tmp11, %tmp19
  br i1 %cmp20, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %indvar.next5 = add i64 %indvar4, 1
  br label %for.cond

for.cond24:                                       ; preds = %for.cond, %for.inc45
  %indvar = phi i64 [ %indvar.next, %for.inc45 ], [ 0, %for.cond ]
  %storemerge2 = trunc i64 %indvar to i32
  %cmp26 = icmp slt i32 %storemerge2, 3
  br i1 %cmp26, label %for.body27, label %return

for.body27:                                       ; preds = %for.cond24
  %arrayidx31 = getelementptr [3 x i32]* @sec31.b2, i64 0, i64 %indvar
  %arrayidx40 = getelementptr [3 x i32]* @sec31.b2, i64 0, i64 %indvar
  %tmp32 = load i32* %arrayidx31, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), i32 %storemerge2, i32 %tmp32) nounwind
  %tmp41 = load i32* %arrayidx40, align 4
  %cmp42 = icmp eq i32 %tmp32, %tmp41
  br i1 %cmp42, label %for.inc45, label %return

for.inc45:                                        ; preds = %for.body27
  %indvar.next = add i64 %indvar, 1
  br label %for.cond24

return:                                           ; preds = %for.body, %for.cond24, %for.body27
  %0 = phi i32 [ 0, %for.cond24 ], [ 1, %for.body27 ], [ 1, %for.body ]
  ret i32 %0
}

define i32 @sec32() nounwind uwtable {
entry:
  %s1 = alloca i32, align 4
  %s17 = bitcast i32* %s1 to i8*
  %s2 = alloca i32, align 4
  %s26 = bitcast i32* %s2 to i8*
  store i32 6513249, i32* %s1, align 4
  store i32 6513249, i32* %s2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar4 = phi i64 [ %indvar.next5, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar4 to i32
  %arrayidx33 = getelementptr [4 x i8]* @.str6, i64 0, i64 %indvar4
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.body, label %for.cond43

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr i8* %s17, i64 %indvar4
  %arrayidx20 = getelementptr i8* %s26, i64 %indvar4
  %tmp12 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp12 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str7, i64 0, i64 0), i32 %storemerge, i32 %conv) nounwind
  %tmp21 = load i8* %arrayidx20, align 1
  %cmp23 = icmp eq i8 %tmp12, %tmp21
  br i1 %cmp23, label %if.end, label %return

if.end:                                           ; preds = %for.body
  %tmp34 = load i8* %arrayidx33, align 1
  %cmp36 = icmp eq i8 %tmp21, %tmp34
  br i1 %cmp36, label %for.inc, label %return

for.inc:                                          ; preds = %if.end
  %indvar.next5 = add i64 %indvar4, 1
  br label %for.cond

for.cond43:                                       ; preds = %for.cond, %for.inc69
  %indvar = phi i64 [ %indvar.next, %for.inc69 ], [ 0, %for.cond ]
  %storemerge2 = trunc i64 %indvar to i32
  %cmp45 = icmp slt i32 %storemerge2, 3
  br i1 %cmp45, label %for.body47, label %return

for.body47:                                       ; preds = %for.cond43
  %arrayidx51 = getelementptr [3 x i8]* @sec32.t2, i64 0, i64 %indvar
  %arrayidx62 = getelementptr [3 x i8]* @sec32.t2, i64 0, i64 %indvar
  %tmp52 = load i8* %arrayidx51, align 1
  %conv53 = sext i8 %tmp52 to i32
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str8, i64 0, i64 0), i32 %storemerge2, i32 %conv53) nounwind
  %tmp63 = load i8* %arrayidx62, align 1
  %cmp65 = icmp eq i8 %tmp52, %tmp63
  br i1 %cmp65, label %for.inc69, label %return

for.inc69:                                        ; preds = %for.body47
  %indvar.next = add i64 %indvar, 1
  br label %for.cond43

return:                                           ; preds = %if.end, %for.body, %for.cond43, %for.body47
  %0 = phi i32 [ 0, %for.cond43 ], [ 1, %for.body47 ], [ 1, %for.body ], [ 1, %if.end ]
  ret i32 %0
}

define i32 @sec33() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0))
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0))
  ret i32 0
}

define i32 @sec34() nounwind uwtable readnone {
return:
  ret i32 0
}

define i32 @sec35() nounwind uwtable {
entry:
  %w2 = alloca [2 x %struct.anon], align 16
  %tmp2 = bitcast [2 x %struct.anon]* %w2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 32, i32 16, i1 false)
  %arrayidx3 = getelementptr inbounds [2 x %struct.anon]* %w2, i64 0, i64 0, i32 0, i64 0
  store i32 1, i32* %arrayidx3, align 16
  %arrayidx6 = getelementptr inbounds [2 x %struct.anon]* %w2, i64 0, i64 1, i32 0, i64 0
  store i32 2, i32* %arrayidx6, align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc41, %entry
  %indvar4 = phi i64 [ %indvar.next5, %for.inc41 ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar4 to i32
  %cmp = icmp slt i32 %storemerge, 2
  br i1 %cmp, label %for.cond10, label %return

for.cond10:                                       ; preds = %for.cond, %for.inc
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.cond ]
  %storemerge1 = trunc i64 %indvar to i32
  %cmp12 = icmp slt i32 %storemerge1, 3
  br i1 %cmp12, label %for.body13, label %for.inc41

for.body13:                                       ; preds = %for.cond10
  %arrayidx37 = getelementptr [2 x %struct.anon]* %w2, i64 0, i64 %indvar4, i32 0, i64 %indvar
  %arrayidx21 = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar4, i32 0, i64 %indvar
  %tmp22 = load i32* %arrayidx21, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i32 %storemerge, i32 %storemerge1, i32 %tmp22) nounwind
  %tmp38 = load i32* %arrayidx37, align 4
  %cmp39 = icmp eq i32 %tmp22, %tmp38
  br i1 %cmp39, label %for.inc, label %return

for.inc:                                          ; preds = %for.body13
  %indvar.next = add i64 %indvar, 1
  br label %for.cond10

for.inc41:                                        ; preds = %for.cond10
  %indvar.next5 = add i64 %indvar4, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body13
  %storemerge2 = phi i32 [ 1, %for.body13 ], [ 0, %for.cond ]
  ret i32 %storemerge2
}

define i32 @sec36() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 20
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [20 x i32]* @sec36.a2, i64 0, i64 %indvar
  %arrayidx14 = getelementptr [20 x i32]* @sec36.a2, i64 0, i64 %indvar
  %tmp7 = load i32* %arrayidx, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %storemerge, i32 %tmp7) nounwind
  %tmp15 = load i32* %arrayidx14, align 4
  %cmp16 = icmp eq i32 %tmp7, %tmp15
  br i1 %cmp16, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %storemerge1 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %storemerge1
}

define i32 @sec38() nounwind uwtable readnone {
return:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %w2.i = alloca [2 x %struct.anon], align 16
  %z1.i = alloca [4 x [3 x i32]], align 16
  %z2.i = alloca [4 x [3 x i32]], align 16
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc33.i, %entry
  %indvar4.i = phi i64 [ %indvar.next5.i, %for.inc33.i ], [ 0, %entry ]
  %storemerge.i = trunc i64 %indvar4.i to i32
  %cmp.i = icmp slt i32 %storemerge.i, 4
  br i1 %cmp.i, label %for.cond6.i, label %if.end

for.cond6.i:                                      ; preds = %for.cond.i, %for.inc.i
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %for.cond.i ]
  %storemerge1.i = trunc i64 %indvar.i to i32
  %cmp8.i = icmp slt i32 %storemerge1.i, 3
  br i1 %cmp8.i, label %for.body9.i, label %for.inc33.i

for.body9.i:                                      ; preds = %for.cond6.i
  %arrayidx15.i = getelementptr [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvar4.i, i64 %indvar.i
  %arrayidx29.i = getelementptr [4 x [3 x i32]]* @sec26.y2, i64 0, i64 %indvar4.i, i64 %indvar.i
  %tmp16.i = load i32* %arrayidx15.i, align 4
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i64 0, i64 0), i32 %storemerge.i, i32 %storemerge1.i, i32 %tmp16.i) nounwind
  %tmp30.i = load i32* %arrayidx29.i, align 4
  %cmp31.i = icmp eq i32 %tmp16.i, %tmp30.i
  br i1 %cmp31.i, label %for.inc.i, label %return

for.inc.i:                                        ; preds = %for.body9.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond6.i

for.inc33.i:                                      ; preds = %for.cond6.i
  %indvar.next5.i = add i64 %indvar4.i, 1
  br label %for.cond.i

if.end:                                           ; preds = %for.cond.i
  %0 = bitcast [4 x [3 x i32]]* %z1.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast [4 x [3 x i32]]* %z2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 48, i32 16, i1 false) nounwind
  %2 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 0, i64 0
  store i32 1, i32* %2, align 16
  %3 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 1, i64 0
  store i32 2, i32* %3, align 4
  %4 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 2, i64 0
  store i32 3, i32* %4, align 8
  %5 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 3, i64 0
  store i32 4, i32* %5, align 4
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 48, i32 16, i1 false) nounwind
  %6 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 0, i64 0
  store i32 1, i32* %6, align 16
  %7 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 1, i64 0
  store i32 2, i32* %7, align 4
  %8 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 2, i64 0
  store i32 3, i32* %8, align 8
  %9 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 3, i64 0
  store i32 4, i32* %9, align 4
  br label %for.cond.i3

for.cond.i3:                                      ; preds = %for.inc33.i17, %if.end
  %indvar5.i = phi i64 [ %indvar.next6.i, %for.inc33.i17 ], [ 0, %if.end ]
  %storemerge.i1 = trunc i64 %indvar5.i to i32
  %cmp.i2 = icmp slt i32 %storemerge.i1, 4
  br i1 %cmp.i2, label %for.cond6.i7, label %if.end4

for.cond6.i7:                                     ; preds = %for.cond.i3, %for.inc.i16
  %indvar.i4 = phi i64 [ %indvar.next.i15, %for.inc.i16 ], [ 0, %for.cond.i3 ]
  %storemerge1.i5 = trunc i64 %indvar.i4 to i32
  %cmp8.i6 = icmp slt i32 %storemerge1.i5, 3
  br i1 %cmp8.i6, label %for.body9.i14, label %for.inc33.i17

for.body9.i14:                                    ; preds = %for.cond6.i7
  %arrayidx15.i9 = getelementptr [4 x [3 x i32]]* %z1.i, i64 0, i64 %indvar5.i, i64 %indvar.i4
  %arrayidx29.i8 = getelementptr [4 x [3 x i32]]* %z2.i, i64 0, i64 %indvar5.i, i64 %indvar.i4
  %tmp16.i10 = load i32* %arrayidx15.i9, align 4
  %call.i11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i32 %storemerge.i1, i32 %storemerge1.i5, i32 %tmp16.i10) nounwind
  %tmp30.i12 = load i32* %arrayidx29.i8, align 4
  %cmp31.i13 = icmp eq i32 %tmp16.i10, %tmp30.i12
  br i1 %cmp31.i13, label %for.inc.i16, label %if.then3

for.inc.i16:                                      ; preds = %for.body9.i14
  %indvar.next.i15 = add i64 %indvar.i4, 1
  br label %for.cond6.i7

for.inc33.i17:                                    ; preds = %for.cond6.i7
  %indvar.next6.i = add i64 %indvar5.i, 1
  br label %for.cond.i3

if.then3:                                         ; preds = %for.body9.i14
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  br label %return

if.end4:                                          ; preds = %for.cond.i3
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  br label %for.cond.i21

for.cond.i21:                                     ; preds = %for.inc47.i, %if.end4
  %indvar3.i = phi i64 [ %indvar.next4.i, %for.inc47.i ], [ 0, %if.end4 ]
  %b.i = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3.i, i32 1
  %b41.i = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3.i, i32 1
  %storemerge.i19 = trunc i64 %indvar3.i to i32
  %cmp.i20 = icmp slt i32 %storemerge.i19, 2
  br i1 %cmp.i20, label %for.cond6.i25, label %if.end8

for.cond6.i25:                                    ; preds = %for.cond.i21, %for.inc.i31
  %indvar.i22 = phi i64 [ %indvar.next.i30, %for.inc.i31 ], [ 0, %for.cond.i21 ]
  %storemerge1.i23 = trunc i64 %indvar.i22 to i32
  %cmp8.i24 = icmp slt i32 %storemerge1.i23, 3
  br i1 %cmp8.i24, label %for.body9.i29, label %for.inc47.i

for.body9.i29:                                    ; preds = %for.cond6.i25
  %arrayidx15.i26 = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3.i, i32 0, i64 %indvar.i22
  %arrayidx31.i = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar3.i, i32 0, i64 %indvar.i22
  %tmp16.i27 = load i32* %arrayidx15.i26, align 4
  %call.i28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i64 0, i64 0), i32 %storemerge.i19, i32 %storemerge1.i23, i32 %tmp16.i27) nounwind
  %tmp32.i = load i32* %arrayidx31.i, align 4
  %cmp33.i = icmp eq i32 %tmp16.i27, %tmp32.i
  br i1 %cmp33.i, label %if.end.i, label %return

if.end.i:                                         ; preds = %for.body9.i29
  %tmp37.i = load i32* %b.i, align 4
  %tmp42.i = load i32* %b41.i, align 4
  %cmp43.i = icmp eq i32 %tmp37.i, %tmp42.i
  br i1 %cmp43.i, label %for.inc.i31, label %return

for.inc.i31:                                      ; preds = %if.end.i
  %indvar.next.i30 = add i64 %indvar.i22, 1
  br label %for.cond6.i25

for.inc47.i:                                      ; preds = %for.cond6.i25
  %indvar.next4.i = add i64 %indvar3.i, 1
  br label %for.cond.i21

if.end8:                                          ; preds = %for.cond.i21
  %call9 = call i32 @sec29()
  %tobool10 = icmp eq i32 %call9, 0
  br i1 %tobool10, label %if.end12, label %return

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @sec31()
  %tobool14 = icmp eq i32 %call13, 0
  br i1 %tobool14, label %if.end16, label %return

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @sec32()
  %tobool18 = icmp eq i32 %call17, 0
  br i1 %tobool18, label %if.end28, label %return

if.end28:                                         ; preds = %if.end16
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0)) nounwind
  %puts1.i = call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0)) nounwind
  %10 = bitcast [2 x %struct.anon]* %w2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %10) nounwind
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 32, i32 16, i1 false) nounwind
  %arrayidx3.i = getelementptr inbounds [2 x %struct.anon]* %w2.i, i64 0, i64 0, i32 0, i64 0
  store i32 1, i32* %arrayidx3.i, align 16
  %arrayidx6.i = getelementptr inbounds [2 x %struct.anon]* %w2.i, i64 0, i64 1, i32 0, i64 0
  store i32 2, i32* %arrayidx6.i, align 16
  br label %for.cond.i36

for.cond.i36:                                     ; preds = %for.inc41.i, %if.end28
  %indvar4.i33 = phi i64 [ %indvar.next5.i42, %for.inc41.i ], [ 0, %if.end28 ]
  %storemerge.i34 = trunc i64 %indvar4.i33 to i32
  %cmp.i35 = icmp slt i32 %storemerge.i34, 2
  br i1 %cmp.i35, label %for.cond10.i, label %if.end32

for.cond10.i:                                     ; preds = %for.cond.i36, %for.inc.i41
  %indvar.i37 = phi i64 [ %indvar.next.i40, %for.inc.i41 ], [ 0, %for.cond.i36 ]
  %storemerge1.i38 = trunc i64 %indvar.i37 to i32
  %cmp12.i = icmp slt i32 %storemerge1.i38, 3
  br i1 %cmp12.i, label %for.body13.i, label %for.inc41.i

for.body13.i:                                     ; preds = %for.cond10.i
  %arrayidx21.i = getelementptr [2 x %struct.anon]* @sec35.w1, i64 0, i64 %indvar4.i33, i32 0, i64 %indvar.i37
  %arrayidx37.i = getelementptr [2 x %struct.anon]* %w2.i, i64 0, i64 %indvar4.i33, i32 0, i64 %indvar.i37
  %tmp22.i = load i32* %arrayidx21.i, align 4
  %call.i39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i32 %storemerge.i34, i32 %storemerge1.i38, i32 %tmp22.i) nounwind
  %tmp38.i = load i32* %arrayidx37.i, align 4
  %cmp39.i = icmp eq i32 %tmp22.i, %tmp38.i
  br i1 %cmp39.i, label %for.inc.i41, label %if.then31

for.inc.i41:                                      ; preds = %for.body13.i
  %indvar.next.i40 = add i64 %indvar.i37, 1
  br label %for.cond10.i

for.inc41.i:                                      ; preds = %for.cond10.i
  %indvar.next5.i42 = add i64 %indvar4.i33, 1
  br label %for.cond.i36

if.then31:                                        ; preds = %for.body13.i
  call void @llvm.lifetime.end(i64 -1, i8* %10) nounwind
  br label %return

if.end32:                                         ; preds = %for.cond.i36
  call void @llvm.lifetime.end(i64 -1, i8* %10) nounwind
  br label %for.cond.i47

for.cond.i47:                                     ; preds = %for.inc.i50, %if.end32
  %indvar.i44 = phi i64 [ %indvar.next.i49, %for.inc.i50 ], [ 0, %if.end32 ]
  %storemerge.i45 = trunc i64 %indvar.i44 to i32
  %cmp.i46 = icmp slt i32 %storemerge.i45, 20
  br i1 %cmp.i46, label %for.body.i, label %return

for.body.i:                                       ; preds = %for.cond.i47
  %arrayidx.i = getelementptr [20 x i32]* @sec36.a2, i64 0, i64 %indvar.i44
  %arrayidx14.i = getelementptr [20 x i32]* @sec36.a2, i64 0, i64 %indvar.i44
  %tmp7.i = load i32* %arrayidx.i, align 4
  %call.i48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0), i32 %storemerge.i45, i32 %tmp7.i) nounwind
  %tmp15.i = load i32* %arrayidx14.i, align 4
  %cmp16.i = icmp eq i32 %tmp7.i, %tmp15.i
  br i1 %cmp16.i, label %for.inc.i50, label %return

for.inc.i50:                                      ; preds = %for.body.i
  %indvar.next.i49 = add i64 %indvar.i44, 1
  br label %for.cond.i47

return:                                           ; preds = %for.body9.i, %if.end.i, %for.body9.i29, %for.cond.i47, %for.body.i, %if.end16, %if.end12, %if.end8, %if.then31, %if.then3
  %11 = phi i32 [ 35, %if.then31 ], [ 27, %if.then3 ], [ 29, %if.end8 ], [ 31, %if.end12 ], [ 32, %if.end16 ], [ 0, %for.cond.i47 ], [ 36, %for.body.i ], [ 28, %for.body9.i29 ], [ 28, %if.end.i ], [ 26, %for.body9.i ]
  ret i32 %11
}

declare i32 @puts(i8* nocapture) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
