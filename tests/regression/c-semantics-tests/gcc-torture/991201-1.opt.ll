; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vc_data = type { i64, [48 x i8] }
%struct.vc = type { %struct.vc_data* }

@a_con = common global %struct.vc_data zeroinitializer, align 8
@vc_cons = global [63 x %struct.vc] [%struct.vc { %struct.vc_data* @a_con }, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer], align 16
@default_red = common global [16 x i32] zeroinitializer, align 16
@default_grn = common global [16 x i32] zeroinitializer, align 16
@default_blu = common global [16 x i32] zeroinitializer, align 16

define void @reset_palette(i32 %currcons) nounwind uwtable {
entry:
  %idxprom2 = sext i32 %currcons to i64
  %d = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i64 0, i64 %idxprom2, i32 0
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv30 = phi i64 [ 0, %entry ], [ %indvars.iv.next31, %for.body ]
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds [16 x i32]* @default_red, i64 0, i64 %indvars.iv30
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %conv = trunc i32 %0 to i8
  %1 = add nsw i64 %indvars.iv, 1
  %2 = load %struct.vc_data** %d, align 8, !tbaa !3
  %arrayidx4 = getelementptr inbounds %struct.vc_data* %2, i64 0, i32 1, i64 %indvars.iv
  store i8 %conv, i8* %arrayidx4, align 1, !tbaa !1
  %arrayidx6 = getelementptr inbounds [16 x i32]* @default_grn, i64 0, i64 %indvars.iv30
  %3 = load i32* %arrayidx6, align 4, !tbaa !0
  %conv7 = trunc i32 %3 to i8
  %4 = add nsw i64 %indvars.iv, 2
  %5 = load %struct.vc_data** %d, align 8, !tbaa !3
  %arrayidx14 = getelementptr inbounds %struct.vc_data* %5, i64 0, i32 1, i64 %1
  store i8 %conv7, i8* %arrayidx14, align 1, !tbaa !1
  %arrayidx16 = getelementptr inbounds [16 x i32]* @default_blu, i64 0, i64 %indvars.iv30
  %6 = load i32* %arrayidx16, align 4, !tbaa !0
  %conv17 = trunc i32 %6 to i8
  %indvars.iv.next = add i64 %indvars.iv, 3
  %7 = load %struct.vc_data** %d, align 8, !tbaa !3
  %arrayidx24 = getelementptr inbounds %struct.vc_data* %7, i64 0, i32 1, i64 %4
  store i8 %conv17, i8* %arrayidx24, align 1, !tbaa !1
  %indvars.iv.next31 = add i64 %indvars.iv30, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next31 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 16
  br i1 %exitcond, label %bar.exit, label %for.body

bar.exit:                                         ; preds = %for.body
  ret void
}

define void @bar(i32 %k) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %k, 48
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv30.i = phi i64 [ 0, %entry ], [ %indvars.iv.next31.i, %for.body.i ]
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [16 x i32]* @default_red, i64 0, i64 %indvars.iv30.i
  %0 = load i32* %arrayidx.i, align 4, !tbaa !0
  %conv.i = trunc i32 %0 to i8
  %1 = add nsw i64 %indvars.iv.i, 1
  %2 = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16, !tbaa !3
  %arrayidx4.i = getelementptr inbounds %struct.vc_data* %2, i64 0, i32 1, i64 %indvars.iv.i
  store i8 %conv.i, i8* %arrayidx4.i, align 1, !tbaa !1
  %arrayidx6.i = getelementptr inbounds [16 x i32]* @default_grn, i64 0, i64 %indvars.iv30.i
  %3 = load i32* %arrayidx6.i, align 4, !tbaa !0
  %conv7.i = trunc i32 %3 to i8
  %4 = add nsw i64 %indvars.iv.i, 2
  %5 = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16, !tbaa !3
  %arrayidx14.i = getelementptr inbounds %struct.vc_data* %5, i64 0, i32 1, i64 %1
  store i8 %conv7.i, i8* %arrayidx14.i, align 1, !tbaa !1
  %arrayidx16.i = getelementptr inbounds [16 x i32]* @default_blu, i64 0, i64 %indvars.iv30.i
  %6 = load i32* %arrayidx16.i, align 4, !tbaa !0
  %conv17.i = trunc i32 %6 to i8
  %indvars.iv.next.i = add i64 %indvars.iv.i, 3
  %7 = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16, !tbaa !3
  %arrayidx24.i = getelementptr inbounds %struct.vc_data* %7, i64 0, i32 1, i64 %4
  store i8 %conv17.i, i8* %arrayidx24.i, align 1, !tbaa !1
  %indvars.iv.next31.i = add i64 %indvars.iv30.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next31.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 16
  br i1 %exitcond, label %reset_palette.exit, label %for.body.i

reset_palette.exit:                               ; preds = %for.body.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
