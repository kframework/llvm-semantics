; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030928-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"a1111\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"a1112\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"a1113\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"a1114\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"a1115\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"a1116\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"a1117\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"a1118\00", align 1

define void @get_addrs(i8** nocapture %x, i32* nocapture %y) nounwind uwtable {
entry:
  %0 = load i32* %y, align 4, !tbaa !0
  %sub = shl i32 %0, 1
  %mul = add i32 %sub, -131072
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds [6 x i8]* @.str, i64 0, i64 %idx.ext
  store i8* %add.ptr, i8** %x, align 8, !tbaa !3
  %arrayidx2 = getelementptr inbounds i32* %y, i64 1
  %1 = load i32* %arrayidx2, align 4, !tbaa !0
  %sub3 = shl i32 %1, 1
  %mul4 = add i32 %sub3, -262144
  %idx.ext5 = sext i32 %mul4 to i64
  %add.ptr6 = getelementptr inbounds [6 x i8]* @.str1, i64 0, i64 %idx.ext5
  %arrayidx7 = getelementptr inbounds i8** %x, i64 1
  store i8* %add.ptr6, i8** %arrayidx7, align 8, !tbaa !3
  %arrayidx8 = getelementptr inbounds i32* %y, i64 2
  %2 = load i32* %arrayidx8, align 4, !tbaa !0
  %sub9 = shl i32 %2, 1
  %mul10 = add i32 %sub9, -393216
  %idx.ext11 = sext i32 %mul10 to i64
  %add.ptr12 = getelementptr inbounds [6 x i8]* @.str2, i64 0, i64 %idx.ext11
  %arrayidx13 = getelementptr inbounds i8** %x, i64 2
  store i8* %add.ptr12, i8** %arrayidx13, align 8, !tbaa !3
  %arrayidx14 = getelementptr inbounds i32* %y, i64 3
  %3 = load i32* %arrayidx14, align 4, !tbaa !0
  %sub15 = shl i32 %3, 1
  %mul16 = add i32 %sub15, -524288
  %idx.ext17 = sext i32 %mul16 to i64
  %add.ptr18 = getelementptr inbounds [6 x i8]* @.str3, i64 0, i64 %idx.ext17
  %arrayidx19 = getelementptr inbounds i8** %x, i64 3
  store i8* %add.ptr18, i8** %arrayidx19, align 8, !tbaa !3
  %arrayidx20 = getelementptr inbounds i32* %y, i64 4
  %4 = load i32* %arrayidx20, align 4, !tbaa !0
  %sub21 = shl i32 %4, 1
  %mul22 = add i32 %sub21, -655360
  %idx.ext23 = sext i32 %mul22 to i64
  %add.ptr24 = getelementptr inbounds [6 x i8]* @.str4, i64 0, i64 %idx.ext23
  %arrayidx25 = getelementptr inbounds i8** %x, i64 4
  store i8* %add.ptr24, i8** %arrayidx25, align 8, !tbaa !3
  %arrayidx26 = getelementptr inbounds i32* %y, i64 5
  %5 = load i32* %arrayidx26, align 4, !tbaa !0
  %sub27 = shl i32 %5, 1
  %mul28 = add i32 %sub27, -786432
  %idx.ext29 = sext i32 %mul28 to i64
  %add.ptr30 = getelementptr inbounds [6 x i8]* @.str5, i64 0, i64 %idx.ext29
  %arrayidx31 = getelementptr inbounds i8** %x, i64 5
  store i8* %add.ptr30, i8** %arrayidx31, align 8, !tbaa !3
  %arrayidx32 = getelementptr inbounds i32* %y, i64 6
  %6 = load i32* %arrayidx32, align 4, !tbaa !0
  %sub33 = shl i32 %6, 1
  %mul34 = add i32 %sub33, -917504
  %idx.ext35 = sext i32 %mul34 to i64
  %add.ptr36 = getelementptr inbounds [6 x i8]* @.str6, i64 0, i64 %idx.ext35
  %arrayidx37 = getelementptr inbounds i8** %x, i64 6
  store i8* %add.ptr36, i8** %arrayidx37, align 8, !tbaa !3
  %arrayidx38 = getelementptr inbounds i32* %y, i64 7
  %7 = load i32* %arrayidx38, align 4, !tbaa !0
  %sub39 = shl i32 %7, 1
  %mul40 = add i32 %sub39, -1048576
  %idx.ext41 = sext i32 %mul40 to i64
  %add.ptr42 = getelementptr inbounds [6 x i8]* @.str7, i64 0, i64 %idx.ext41
  %arrayidx43 = getelementptr inbounds i8** %x, i64 7
  store i8* %add.ptr42, i8** %arrayidx43, align 8, !tbaa !3
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [8 x i8*], align 16
  %y = alloca [8 x i32], align 16
  %arrayidx = getelementptr inbounds [8 x i32]* %y, i64 0, i64 0
  store i32 65536, i32* %arrayidx, align 16, !tbaa !0
  %arrayidx.1 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 1
  store i32 131072, i32* %arrayidx.1, align 4, !tbaa !0
  %arrayidx.2 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 2
  store i32 196608, i32* %arrayidx.2, align 8, !tbaa !0
  %arrayidx.3 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 3
  store i32 262144, i32* %arrayidx.3, align 4, !tbaa !0
  %arrayidx.4 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 4
  store i32 327680, i32* %arrayidx.4, align 16, !tbaa !0
  %arrayidx.5 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 5
  store i32 393216, i32* %arrayidx.5, align 4, !tbaa !0
  %arrayidx.6 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 6
  store i32 458752, i32* %arrayidx.6, align 8, !tbaa !0
  %arrayidx.7 = getelementptr inbounds [8 x i32]* %y, i64 0, i64 7
  store i32 524288, i32* %arrayidx.7, align 4, !tbaa !0
  %arraydecay = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 0
  store i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0), i8** %arraydecay, align 16, !tbaa !3
  %arrayidx7.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 1
  store i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8** %arrayidx7.i, align 8, !tbaa !3
  %arrayidx13.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 2
  store i8* getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), i8** %arrayidx13.i, align 16, !tbaa !3
  %arrayidx19.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 3
  store i8* getelementptr inbounds ([6 x i8]* @.str3, i64 0, i64 0), i8** %arrayidx19.i, align 8, !tbaa !3
  %arrayidx25.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 4
  store i8* getelementptr inbounds ([6 x i8]* @.str4, i64 0, i64 0), i8** %arrayidx25.i, align 16, !tbaa !3
  %arrayidx31.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 5
  store i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i8** %arrayidx31.i, align 8, !tbaa !3
  %arrayidx37.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 6
  store i8* getelementptr inbounds ([6 x i8]* @.str6, i64 0, i64 0), i8** %arrayidx37.i, align 16, !tbaa !3
  %arrayidx43.i = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 7
  store i8* getelementptr inbounds ([6 x i8]* @.str7, i64 0, i64 0), i8** %arrayidx43.i, align 8, !tbaa !3
  br label %for.cond2

for.cond2:                                        ; preds = %for.body4, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body4 ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp3 = icmp slt i32 %0, 8
  br i1 %cmp3, label %for.body4, label %for.end11

for.body4:                                        ; preds = %for.cond2
  %arrayidx6 = getelementptr inbounds [8 x i8*]* %x, i64 0, i64 %indvars.iv
  %1 = load i8** %arrayidx6, align 8, !tbaa !3
  %2 = load i8* %1, align 1, !tbaa !1
  %cmp7 = icmp eq i8 %2, 97
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp7, label %for.cond2, label %if.then

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

for.end11:                                        ; preds = %for.cond2
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
