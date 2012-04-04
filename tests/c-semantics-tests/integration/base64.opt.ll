; ModuleID = '/home/david/src/c-semantics/tests/integration/base64.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@b64 = global [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@nbytes = global [4 x i32] [i32 3, i32 1, i32 1, i32 2], align 16
@.str = private unnamed_addr constant [25 x i8] c"TGl0ZXJhdGVQcm9ncmFtcw==\00", align 1
@stdout = external global %struct._IO_FILE*

define void @xlate(i8* nocapture %in, i32 %phase) nounwind uwtable {
entry:
  %out = alloca [3 x i8], align 1
  %0 = load i8* %in, align 1, !tbaa !0
  %shl = shl i8 %0, 2
  %arrayidx1 = getelementptr inbounds i8* %in, i64 1
  %1 = load i8* %arrayidx1, align 1, !tbaa !0
  %shr28 = lshr i8 %1, 4
  %or = or i8 %shr28, %shl
  %arrayidx4 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 0
  store i8 %or, i8* %arrayidx4, align 1, !tbaa !0
  %shl7 = shl i8 %1, 4
  %arrayidx8 = getelementptr inbounds i8* %in, i64 2
  %2 = load i8* %arrayidx8, align 1, !tbaa !0
  %shr1029 = lshr i8 %2, 2
  %or11 = or i8 %shr1029, %shl7
  %arrayidx13 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 1
  store i8 %or11, i8* %arrayidx13, align 1, !tbaa !0
  %shl16 = shl i8 %2, 6
  %arrayidx17 = getelementptr inbounds i8* %in, i64 3
  %3 = load i8* %arrayidx17, align 1, !tbaa !0
  %or20 = or i8 %shl16, %3
  %arrayidx22 = getelementptr inbounds [3 x i8]* %out, i64 0, i64 2
  store i8 %or20, i8* %arrayidx22, align 1, !tbaa !0
  %idxprom = sext i32 %phase to i64
  %arrayidx23 = getelementptr inbounds [4 x i32]* @nbytes, i64 0, i64 %idxprom
  %4 = load i32* %arrayidx23, align 4, !tbaa !2
  %cmp30 = icmp sgt i32 %4, 0
  br i1 %cmp30, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body.for.body_crit_edge
  %5 = phi i8 [ %.pre, %for.body.for.body_crit_edge ], [ %or, %entry ]
  %indvars.iv = phi i64 [ %phitmp, %for.body.for.body_crit_edge ], [ 1, %entry ]
  %conv27 = zext i8 %5 to i32
  %6 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i = call i32 @_IO_putc(i32 %conv27, %struct._IO_FILE* %6) nounwind
  %7 = load i32* %arrayidx23, align 4, !tbaa !2
  %8 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %8, %7
  br i1 %cmp, label %for.body.for.body_crit_edge, label %for.end

for.body.for.body_crit_edge:                      ; preds = %for.body
  %arrayidx26.phi.trans.insert = getelementptr inbounds [3 x i8]* %out, i64 0, i64 %indvars.iv
  %.pre = load i8* %arrayidx26.phi.trans.insert, align 1, !tbaa !0
  %phitmp = add i64 %indvars.iv, 1
  br label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %out.i = alloca [3 x i8], align 1
  %in = alloca i32, align 4
  %tmpcast = bitcast i32* %in to [4 x i8]*
  %arraydecay9 = bitcast i32* %in to i8*
  %0 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 0
  %arrayidx1.i18 = getelementptr inbounds [4 x i8]* %tmpcast, i64 0, i64 1
  %arrayidx8.i23 = getelementptr inbounds [4 x i8]* %tmpcast, i64 0, i64 2
  %arrayidx13.i26 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 1
  %arrayidx17.i28 = getelementptr inbounds [4 x i8]* %tmpcast, i64 0, i64 3
  %arrayidx22.i30 = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 2
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %if.then4, %xlate.exit43, %entry
  %phase.0.ph = phi i32 [ 0, %entry ], [ %rem, %xlate.exit43 ], [ %rem, %if.then4 ]
  %input.0.ph = phi i8* [ getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr, %xlate.exit43 ], [ %incdec.ptr, %if.then4 ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %if.end
  %input.0 = phi i8* [ %incdec.ptr, %if.end ], [ %input.0.ph, %while.cond.outer ]
  %incdec.ptr = getelementptr inbounds i8* %input.0, i64 1
  %1 = load i8* %input.0, align 1, !tbaa !0
  switch i8 %1, label %if.end [
    i8 0, label %while.end
    i8 61, label %if.then
  ]

if.then:                                          ; preds = %while.cond
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %2 = load i8* %arraydecay9, align 4, !tbaa !0
  %shl.i = shl i8 %2, 2
  %3 = load i8* %arrayidx1.i18, align 1, !tbaa !0
  %shr28.i = lshr i8 %3, 4
  %or.i = or i8 %shr28.i, %shl.i
  store i8 %or.i, i8* %0, align 1, !tbaa !0
  %shl7.i = shl i8 %3, 4
  %4 = load i8* %arrayidx8.i23, align 2, !tbaa !0
  %shr1029.i = lshr i8 %4, 2
  %or11.i = or i8 %shr1029.i, %shl7.i
  store i8 %or11.i, i8* %arrayidx13.i26, align 1, !tbaa !0
  %shl16.i = shl i8 %4, 6
  %5 = load i8* %arrayidx17.i28, align 1, !tbaa !0
  %or20.i = or i8 %shl16.i, %5
  store i8 %or20.i, i8* %arrayidx22.i30, align 1, !tbaa !0
  %idxprom.i = sext i32 %phase.0.ph to i64
  %arrayidx23.i = getelementptr inbounds [4 x i32]* @nbytes, i64 0, i64 %idxprom.i
  %6 = load i32* %arrayidx23.i, align 4, !tbaa !2
  %cmp30.i = icmp sgt i32 %6, 0
  br i1 %cmp30.i, label %for.body.i.preheader, label %while.end

for.body.i.preheader:                             ; preds = %if.then
  %conv27.i44 = zext i8 %or.i to i32
  %7 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i45 = call i32 @_IO_putc(i32 %conv27.i44, %struct._IO_FILE* %7) nounwind
  %8 = load i32* %arrayidx23.i, align 4, !tbaa !2
  %cmp.i46 = icmp sgt i32 %8, 1
  br i1 %cmp.i46, label %for.body.for.body_crit_edge.i, label %while.end

for.body.for.body_crit_edge.i:                    ; preds = %for.body.i.preheader, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge
  %.pre.i = phi i8 [ %.pre.i.pre, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge ], [ %or11.i, %for.body.i.preheader ]
  %indvars.iv.i47 = phi i64 [ %phitmp, %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge ], [ 2, %for.body.i.preheader ]
  %conv27.i = zext i8 %.pre.i to i32
  %9 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i = call i32 @_IO_putc(i32 %conv27.i, %struct._IO_FILE* %9) nounwind
  %10 = load i32* %arrayidx23.i, align 4, !tbaa !2
  %11 = trunc i64 %indvars.iv.i47 to i32
  %cmp.i = icmp slt i32 %11, %10
  br i1 %cmp.i, label %for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge, label %while.end

for.body.for.body_crit_edge.i.for.body.for.body_crit_edge.i_crit_edge: ; preds = %for.body.for.body_crit_edge.i
  %arrayidx26.phi.trans.insert.i.phi.trans.insert = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 %indvars.iv.i47
  %.pre.i.pre = load i8* %arrayidx26.phi.trans.insert.i.phi.trans.insert, align 1, !tbaa !0
  %phitmp = add i64 %indvars.iv.i47, 1
  br label %for.body.for.body_crit_edge.i

if.end:                                           ; preds = %while.cond
  %conv = sext i8 %1 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([65 x i8]* @b64, i64 0, i64 0), i32 %conv) nounwind
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %while.cond, label %if.then4

if.then4:                                         ; preds = %if.end
  %sub.ptr.lhs.cast = ptrtoint i8* %call to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([65 x i8]* @b64 to i64)
  %conv5 = trunc i64 %sub.ptr.sub to i8
  %idxprom = sext i32 %phase.0.ph to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %tmpcast, i64 0, i64 %idxprom
  store i8 %conv5, i8* %arrayidx, align 1, !tbaa !0
  %add = add nsw i32 %phase.0.ph, 1
  %rem = srem i32 %add, 4
  %cmp6 = icmp eq i32 %rem, 0
  br i1 %cmp6, label %if.then8, label %while.cond.outer

if.then8:                                         ; preds = %if.then4
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %12 = load i8* %arraydecay9, align 4, !tbaa !0
  %shl.i17 = shl i8 %12, 2
  %13 = load i8* %arrayidx1.i18, align 1, !tbaa !0
  %shr28.i19 = lshr i8 %13, 4
  %or.i20 = or i8 %shr28.i19, %shl.i17
  store i8 %or.i20, i8* %0, align 1, !tbaa !0
  %shl7.i22 = shl i8 %13, 4
  %14 = load i8* %arrayidx8.i23, align 2, !tbaa !0
  %shr1029.i24 = lshr i8 %14, 2
  %or11.i25 = or i8 %shr1029.i24, %shl7.i22
  store i8 %or11.i25, i8* %arrayidx13.i26, align 1, !tbaa !0
  %shl16.i27 = shl i8 %14, 6
  %15 = load i8* %arrayidx17.i28, align 1, !tbaa !0
  %or20.i29 = or i8 %shl16.i27, %15
  store i8 %or20.i29, i8* %arrayidx22.i30, align 1, !tbaa !0
  %16 = load i32* getelementptr inbounds ([4 x i32]* @nbytes, i64 0, i64 0), align 16, !tbaa !2
  %cmp30.i33 = icmp sgt i32 %16, 0
  br i1 %cmp30.i33, label %for.body.i38.preheader, label %xlate.exit43

for.body.i38.preheader:                           ; preds = %if.then8
  %conv27.i3548 = zext i8 %or.i20 to i32
  %17 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i3649 = call i32 @_IO_putc(i32 %conv27.i3548, %struct._IO_FILE* %17) nounwind
  %18 = load i32* getelementptr inbounds ([4 x i32]* @nbytes, i64 0, i64 0), align 16, !tbaa !2
  %cmp.i3750 = icmp sgt i32 %18, 1
  br i1 %cmp.i3750, label %for.body.for.body_crit_edge.i42, label %xlate.exit43

for.body.for.body_crit_edge.i42:                  ; preds = %for.body.i38.preheader, %for.body.for.body_crit_edge.i42.for.body.for.body_crit_edge.i42_crit_edge
  %.pre.i40 = phi i8 [ %.pre.i40.pre, %for.body.for.body_crit_edge.i42.for.body.for.body_crit_edge.i42_crit_edge ], [ %or11.i25, %for.body.i38.preheader ]
  %indvars.iv.i3451 = phi i64 [ %phitmp61, %for.body.for.body_crit_edge.i42.for.body.for.body_crit_edge.i42_crit_edge ], [ 2, %for.body.i38.preheader ]
  %conv27.i35 = zext i8 %.pre.i40 to i32
  %19 = load %struct._IO_FILE** @stdout, align 8, !tbaa !3
  %call.i.i36 = call i32 @_IO_putc(i32 %conv27.i35, %struct._IO_FILE* %19) nounwind
  %20 = load i32* getelementptr inbounds ([4 x i32]* @nbytes, i64 0, i64 0), align 16, !tbaa !2
  %21 = trunc i64 %indvars.iv.i3451 to i32
  %cmp.i37 = icmp slt i32 %21, %20
  br i1 %cmp.i37, label %for.body.for.body_crit_edge.i42.for.body.for.body_crit_edge.i42_crit_edge, label %xlate.exit43

for.body.for.body_crit_edge.i42.for.body.for.body_crit_edge.i42_crit_edge: ; preds = %for.body.for.body_crit_edge.i42
  %arrayidx26.phi.trans.insert.i39.phi.trans.insert = getelementptr inbounds [3 x i8]* %out.i, i64 0, i64 %indvars.iv.i3451
  %.pre.i40.pre = load i8* %arrayidx26.phi.trans.insert.i39.phi.trans.insert, align 1, !tbaa !0
  %phitmp61 = add i64 %indvars.iv.i3451, 1
  br label %for.body.for.body_crit_edge.i42

xlate.exit43:                                     ; preds = %for.body.i38.preheader, %for.body.for.body_crit_edge.i42, %if.then8
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  store i32 0, i32* %in, align 4
  br label %while.cond.outer

while.end:                                        ; preds = %while.cond, %for.body.i.preheader, %for.body.for.body_crit_edge.i, %if.then
  ret i32 0
}

declare i8* @strchr(i8*, i32) nounwind readonly

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"any pointer", metadata !0}
