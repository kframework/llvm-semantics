; ModuleID = '/home/david/src/c-semantics/tests/integration/sierpinski.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdout = external global %struct._IO_FILE*

define i8* @apply_rules(i8* %new_sl, i8* nocapture %sl, i64 %width) nounwind uwtable {
entry:
  %0 = load i8* %sl, align 1, !tbaa !0
  %tobool = icmp eq i8 %0, 0
  br i1 %tobool, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8* %sl, i64 1
  %1 = load i8* %arrayidx1, align 1, !tbaa !0
  %tobool3 = icmp ne i8 %1, 0
  br label %lor.end

lor.end:                                          ; preds = %entry, %lor.rhs
  %2 = phi i1 [ true, %entry ], [ %tobool3, %lor.rhs ]
  %conv4 = zext i1 %2 to i8
  store i8 %conv4, i8* %new_sl, align 1, !tbaa !0
  %sub = add i64 %width, -2
  %arrayidx6 = getelementptr inbounds i8* %sl, i64 %sub
  %3 = load i8* %arrayidx6, align 1, !tbaa !0
  %tobool8 = icmp eq i8 %3, 0
  %sub10 = add i64 %width, -1
  br i1 %tobool8, label %lor.rhs9, label %lor.end14

lor.rhs9:                                         ; preds = %lor.end
  %arrayidx11 = getelementptr inbounds i8* %sl, i64 %sub10
  %4 = load i8* %arrayidx11, align 1, !tbaa !0
  %tobool13 = icmp ne i8 %4, 0
  br label %lor.end14

lor.end14:                                        ; preds = %lor.end, %lor.rhs9
  %5 = phi i1 [ %tobool13, %lor.rhs9 ], [ true, %lor.end ]
  %conv16 = zext i1 %5 to i8
  %arrayidx18 = getelementptr inbounds i8* %new_sl, i64 %sub10
  store i8 %conv16, i8* %arrayidx18, align 1, !tbaa !0
  %cmp63 = icmp ugt i64 %sub10, 1
  br i1 %cmp63, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end14, %land.end48
  %indvars.iv = phi i64 [ %indvars.iv.next, %land.end48 ], [ 1, %lor.end14 ]
  %6 = add nsw i64 %indvars.iv, -1
  %arrayidx23 = getelementptr inbounds i8* %sl, i64 %6
  %7 = load i8* %arrayidx23, align 1, !tbaa !0
  %tobool25 = icmp eq i8 %7, 0
  %arrayidx41.phi.trans.insert = getelementptr inbounds i8* %sl, i64 %indvars.iv
  %.pre = load i8* %arrayidx41.phi.trans.insert, align 1, !tbaa !0
  %tobool42 = icmp eq i8 %.pre, 0
  br i1 %tobool25, label %land.lhs.true39, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body
  br i1 %tobool42, label %land.end48, label %land.rhs

land.rhs:                                         ; preds = %land.lhs.true
  %8 = add nsw i64 %indvars.iv, 1
  %arrayidx31 = getelementptr inbounds i8* %sl, i64 %8
  %9 = load i8* %arrayidx31, align 1, !tbaa !0
  %tobool33 = icmp ne i8 %9, 0
  br label %land.end48

land.lhs.true39:                                  ; preds = %for.body
  br i1 %tobool42, label %land.rhs43, label %land.end48

land.rhs43:                                       ; preds = %land.lhs.true39
  %10 = add nsw i64 %indvars.iv, 1
  %arrayidx46 = getelementptr inbounds i8* %sl, i64 %10
  %11 = load i8* %arrayidx46, align 1, !tbaa !0
  %lnot = icmp eq i8 %11, 0
  br label %land.end48

land.end48:                                       ; preds = %land.rhs, %land.lhs.true, %land.lhs.true39, %land.rhs43
  %12 = phi i1 [ false, %land.lhs.true39 ], [ false, %land.rhs43 ], [ false, %land.lhs.true ], [ %tobool33, %land.rhs ]
  %13 = phi i1 [ false, %land.lhs.true39 ], [ %lnot, %land.rhs43 ], [ false, %land.lhs.true ], [ false, %land.rhs ]
  %. = or i1 %12, %13
  %14 = zext i1 %. to i8
  %conv59 = xor i8 %14, 1
  %arrayidx61 = getelementptr inbounds i8* %new_sl, i64 %indvars.iv
  store i8 %conv59, i8* %arrayidx61, align 1, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %sub10
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %land.end48, %lor.end14
  ret i8* %new_sl
}

define void @print_statelist(i8* nocapture %sl, i64 %width) nounwind uwtable {
entry:
  %cmp5 = icmp eq i64 %width, 0
  br i1 %cmp5, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i8* %sl, i64 %indvars.iv
  %0 = load i8* %arrayidx, align 1, !tbaa !0
  %tobool = icmp ne i8 %0, 0
  %cond = select i1 %tobool, i32 64, i32 32
  %1 = load %struct._IO_FILE** @stdout, align 8, !tbaa !2
  %call.i = tail call i32 @_IO_putc(i32 %cond, %struct._IO_FILE* %1) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %width
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %2 = load %struct._IO_FILE** @stdout, align 8, !tbaa !2
  %call.i4 = tail call i32 @_IO_putc(i32 10, %struct._IO_FILE* %2) nounwind
  ret void
}

define void @run_and_display(i64 %niters) nounwind uwtable {
entry:
  %statelist1 = alloca [80 x i8], align 16
  %statelist2 = alloca [80 x i8], align 16
  %arraydecay = getelementptr inbounds [80 x i8]* %statelist1, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay, i8 0, i64 80, i32 16, i1 false)
  %arrayidx = getelementptr inbounds [80 x i8]* %statelist1, i64 0, i64 40
  store i8 1, i8* %arrayidx, align 8, !tbaa !0
  %arraydecay2 = getelementptr inbounds [80 x i8]* %statelist2, i64 0, i64 0
  %cmp14 = icmp eq i64 %niters, 0
  br i1 %cmp14, label %for.end, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %entry, %apply_rules.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %apply_rules.exit ], [ 0, %entry ]
  %statelist.016 = phi i8* [ %new_statelist.015, %apply_rules.exit ], [ %arraydecay, %entry ]
  %new_statelist.015 = phi i8* [ %arraydecay2.arraydecay, %apply_rules.exit ], [ %arraydecay2, %entry ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.i.preheader
  %indvars.iv.i = phi i64 [ 0, %for.body.i.preheader ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds i8* %statelist.016, i64 %indvars.iv.i
  %0 = load i8* %arrayidx.i, align 1, !tbaa !0
  %tobool.i = icmp ne i8 %0, 0
  %cond.i = select i1 %tobool.i, i32 64, i32 32
  %1 = load %struct._IO_FILE** @stdout, align 8, !tbaa !2
  %call.i.i = call i32 @_IO_putc(i32 %cond.i, %struct._IO_FILE* %1) nounwind
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 80
  br i1 %exitcond.i, label %print_statelist.exit, label %for.body.i

print_statelist.exit:                             ; preds = %for.body.i
  %2 = load %struct._IO_FILE** @stdout, align 8, !tbaa !2
  %call.i4.i = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %2) nounwind
  %3 = load i8* %statelist.016, align 1, !tbaa !0
  %tobool.i9 = icmp eq i8 %3, 0
  br i1 %tobool.i9, label %lor.rhs.i, label %lor.end.i

lor.rhs.i:                                        ; preds = %print_statelist.exit
  %arrayidx1.i = getelementptr inbounds i8* %statelist.016, i64 1
  %4 = load i8* %arrayidx1.i, align 1, !tbaa !0
  %tobool3.i = icmp ne i8 %4, 0
  br label %lor.end.i

lor.end.i:                                        ; preds = %lor.rhs.i, %print_statelist.exit
  %5 = phi i1 [ true, %print_statelist.exit ], [ %tobool3.i, %lor.rhs.i ]
  %conv4.i = zext i1 %5 to i8
  store i8 %conv4.i, i8* %new_statelist.015, align 1, !tbaa !0
  %arrayidx6.i = getelementptr inbounds i8* %statelist.016, i64 78
  %6 = load i8* %arrayidx6.i, align 1, !tbaa !0
  %tobool8.i = icmp eq i8 %6, 0
  br i1 %tobool8.i, label %lor.rhs9.i, label %lor.end14.i

lor.rhs9.i:                                       ; preds = %lor.end.i
  %arrayidx11.i = getelementptr inbounds i8* %statelist.016, i64 79
  %7 = load i8* %arrayidx11.i, align 1, !tbaa !0
  %tobool13.i = icmp ne i8 %7, 0
  br label %lor.end14.i

lor.end14.i:                                      ; preds = %lor.rhs9.i, %lor.end.i
  %8 = phi i1 [ %tobool13.i, %lor.rhs9.i ], [ true, %lor.end.i ]
  %conv16.i = zext i1 %8 to i8
  %arrayidx18.i = getelementptr inbounds i8* %new_statelist.015, i64 79
  store i8 %conv16.i, i8* %arrayidx18.i, align 1, !tbaa !0
  br label %for.body.i11

for.body.i11:                                     ; preds = %land.end48.i, %lor.end14.i
  %indvars.iv.i10 = phi i64 [ %indvars.iv.next.i12, %land.end48.i ], [ 1, %lor.end14.i ]
  %9 = add nsw i64 %indvars.iv.i10, -1
  %arrayidx23.i = getelementptr inbounds i8* %statelist.016, i64 %9
  %10 = load i8* %arrayidx23.i, align 1, !tbaa !0
  %tobool25.i = icmp eq i8 %10, 0
  %arrayidx41.phi.trans.insert.i = getelementptr inbounds i8* %statelist.016, i64 %indvars.iv.i10
  %.pre.i = load i8* %arrayidx41.phi.trans.insert.i, align 1, !tbaa !0
  %tobool42.i = icmp eq i8 %.pre.i, 0
  br i1 %tobool25.i, label %land.lhs.true39.i, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %for.body.i11
  br i1 %tobool42.i, label %land.end48.i, label %land.rhs.i

land.rhs.i:                                       ; preds = %land.lhs.true.i
  %11 = add nsw i64 %indvars.iv.i10, 1
  %arrayidx31.i = getelementptr inbounds i8* %statelist.016, i64 %11
  %12 = load i8* %arrayidx31.i, align 1, !tbaa !0
  %tobool33.i = icmp ne i8 %12, 0
  br label %land.end48.i

land.lhs.true39.i:                                ; preds = %for.body.i11
  br i1 %tobool42.i, label %land.rhs43.i, label %land.end48.i

land.rhs43.i:                                     ; preds = %land.lhs.true39.i
  %13 = add nsw i64 %indvars.iv.i10, 1
  %arrayidx46.i = getelementptr inbounds i8* %statelist.016, i64 %13
  %14 = load i8* %arrayidx46.i, align 1, !tbaa !0
  %lnot.i = icmp eq i8 %14, 0
  br label %land.end48.i

land.end48.i:                                     ; preds = %land.rhs43.i, %land.lhs.true39.i, %land.rhs.i, %land.lhs.true.i
  %15 = phi i1 [ false, %land.lhs.true39.i ], [ false, %land.rhs43.i ], [ false, %land.lhs.true.i ], [ %tobool33.i, %land.rhs.i ]
  %16 = phi i1 [ false, %land.lhs.true39.i ], [ %lnot.i, %land.rhs43.i ], [ false, %land.lhs.true.i ], [ false, %land.rhs.i ]
  %..i = or i1 %15, %16
  %17 = zext i1 %..i to i8
  %conv59.i = xor i8 %17, 1
  %arrayidx61.i = getelementptr inbounds i8* %new_statelist.015, i64 %indvars.iv.i10
  store i8 %conv59.i, i8* %arrayidx61.i, align 1, !tbaa !0
  %indvars.iv.next.i12 = add i64 %indvars.iv.i10, 1
  %exitcond.i13 = icmp eq i64 %indvars.iv.next.i12, 79
  br i1 %exitcond.i13, label %apply_rules.exit, label %for.body.i11

apply_rules.exit:                                 ; preds = %land.end48.i
  %cmp5 = icmp eq i8* %new_statelist.015, %arraydecay
  %arraydecay2.arraydecay = select i1 %cmp5, i8* %arraydecay2, i8* %arraydecay
  %indvars.iv.next = add i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %niters
  br i1 %exitcond, label %for.end, label %for.body.i.preheader

for.end:                                          ; preds = %apply_rules.exit, %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @run_and_display(i64 2)
  ret i32 0
}

declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"any pointer", metadata !0}
