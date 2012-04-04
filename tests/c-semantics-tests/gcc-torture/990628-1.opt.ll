; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.data_record = type { i32, [100 x i32] }
%struct.anon = type { i64 }

@fetch.fetch_count = internal unnamed_addr global i32 0, align 4
@data_tmp = common global %struct.data_record zeroinitializer, align 4
@sqlca = common global %struct.anon zeroinitializer, align 8
@data_ptr = common global %struct.data_record* null, align 8

define i32 @num_records() nounwind uwtable readnone {
entry:
  ret i32 1
}

define void @fetch() nounwind uwtable {
entry:
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false)
  %0 = load i32* @fetch.fetch_count, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @fetch.fetch_count, align 4, !tbaa !0
  %cmp = icmp sgt i32 %0, 0
  %conv = select i1 %cmp, i64 100, i64 0
  store i64 %conv, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8, !tbaa !3
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @load_data() nounwind uwtable {
entry:
  %call1 = tail call noalias i8* @malloc(i64 404) nounwind
  %0 = bitcast i8* %call1 to %struct.data_record*
  store %struct.data_record* %0, %struct.data_record** @data_ptr, align 8, !tbaa !4
  tail call void @llvm.memset.p0i8.i64(i8* %call1, i8 -86, i64 404, i32 4, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %1 = load i32* @fetch.fetch_count, align 4, !tbaa !0
  %inc.i5 = add nsw i32 %1, 1
  store i32 %inc.i5, i32* @fetch.fetch_count, align 4, !tbaa !0
  %cmp.i6 = icmp sgt i32 %1, 0
  %conv.i7 = select i1 %cmp.i6, i64 100, i64 0
  store i64 %conv.i7, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8, !tbaa !3
  br i1 %cmp.i6, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %inc.i10 = phi i32 [ %inc.i, %while.body ], [ %inc.i5, %entry ]
  %p.09 = phi %struct.data_record* [ %incdec.ptr, %while.body ], [ %0, %entry ]
  %incdec.ptr = getelementptr inbounds %struct.data_record* %p.09, i64 1
  %2 = bitcast %struct.data_record* %p.09 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %inc.i = add nsw i32 %inc.i10, 1
  %cmp.i = icmp sgt i32 %inc.i10, 0
  %conv.i = select i1 %cmp.i, i64 100, i64 0
  store i64 %conv.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8, !tbaa !3
  br i1 %cmp.i, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i32 2, i32* @fetch.fetch_count, align 4
  br label %while.end

while.end:                                        ; preds = %entry, %while.cond.while.end_crit_edge
  ret void
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %call1.i = tail call noalias i8* @malloc(i64 404) nounwind
  %0 = bitcast i8* %call1.i to %struct.data_record*
  store %struct.data_record* %0, %struct.data_record** @data_ptr, align 8, !tbaa !4
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 -86, i64 404, i32 4, i1 false) nounwind
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %1 = load i32* @fetch.fetch_count, align 4, !tbaa !0
  %inc.i5.i = add nsw i32 %1, 1
  store i32 %inc.i5.i, i32* @fetch.fetch_count, align 4, !tbaa !0
  %cmp.i6.i = icmp sgt i32 %1, 0
  %conv.i7.i = select i1 %cmp.i6.i, i64 100, i64 0
  store i64 %conv.i7.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8, !tbaa !3
  br i1 %cmp.i6.i, label %load_data.exit, label %while.body.i

while.body.i:                                     ; preds = %entry, %while.body.i
  %inc.i10.i = phi i32 [ %inc.i.i, %while.body.i ], [ %inc.i5.i, %entry ]
  %p.09.i = phi %struct.data_record* [ %incdec.ptr.i, %while.body.i ], [ %0, %entry ]
  %incdec.ptr.i = getelementptr inbounds %struct.data_record* %p.09.i, i64 1
  %2 = bitcast %struct.data_record* %p.09.i to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false) nounwind
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %inc.i.i = add nsw i32 %inc.i10.i, 1
  %cmp.i.i = icmp sgt i32 %inc.i10.i, 0
  %conv.i.i = select i1 %cmp.i.i, i64 100, i64 0
  store i64 %conv.i.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8, !tbaa !3
  %exitcond = icmp eq i32 %inc.i.i, 2
  br i1 %exitcond, label %while.cond.while.end_crit_edge.i, label %while.body.i

while.cond.while.end_crit_edge.i:                 ; preds = %while.body.i
  store i32 2, i32* @fetch.fetch_count, align 4
  %.pre = load %struct.data_record** @data_ptr, align 8, !tbaa !4
  br label %load_data.exit

load_data.exit:                                   ; preds = %entry, %while.cond.while.end_crit_edge.i
  %3 = phi %struct.data_record* [ %0, %entry ], [ %.pre, %while.cond.while.end_crit_edge.i ]
  %dummy = getelementptr inbounds %struct.data_record* %3, i64 0, i32 0
  %4 = load i32* %dummy, align 4, !tbaa !0
  %cmp = icmp eq i32 %4, 1431655765
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %load_data.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %load_data.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long", metadata !1}
!4 = metadata !{metadata !"any pointer", metadata !1}
