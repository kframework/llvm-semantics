; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990628-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i64 }
%struct.data_record = type { i32, [100 x i32] }

@fetch.fetch_count = internal unnamed_addr global i32 0, align 4
@data_tmp = common global %struct.data_record zeroinitializer, align 4
@sqlca = common global %struct.anon zeroinitializer, align 8
@data_ptr = common global %struct.data_record* null, align 8

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

define i32 @num_records() nounwind uwtable readnone {
entry:
  ret i32 1
}

define void @fetch() nounwind uwtable {
entry:
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false)
  %tmp = load i32* @fetch.fetch_count, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @fetch.fetch_count, align 4
  %cmp = icmp sgt i32 %tmp, 0
  %conv = select i1 %cmp, i64 100, i64 0
  store i64 %conv, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @load_data() nounwind uwtable {
entry:
  %call1 = tail call noalias i8* @malloc(i64 404) nounwind
  %0 = bitcast i8* %call1 to %struct.data_record*
  store %struct.data_record* %0, %struct.data_record** @data_ptr, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %call1, i8 -86, i64 404, i32 1, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %tmp.i1 = load i32* @fetch.fetch_count, align 4
  %inc.i2 = add nsw i32 %tmp.i1, 1
  store i32 %inc.i2, i32* @fetch.fetch_count, align 4
  %cmp.i3 = icmp sgt i32 %tmp.i1, 0
  %conv.i4 = select i1 %cmp.i3, i64 100, i64 0
  store i64 %conv.i4, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8
  br i1 %cmp.i3, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp = icmp sgt i32 %inc.i2, 1
  %smax = select i1 %tmp, i32 %inc.i2, i32 1
  %tmp11 = sub i32 %smax, %inc.i2
  %tmp12 = zext i32 %tmp11 to i64
  %tmp13 = add i64 %tmp12, 1
  %tmp14 = zext i32 %inc.i2 to i64
  br label %while.body

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %while.body.lr.ph ]
  %tmp15 = add i64 %tmp14, %indvar
  %inc.i8 = trunc i64 %tmp15 to i32
  %scevgep = getelementptr %struct.data_record* %0, i64 %indvar
  %tmp10 = bitcast %struct.data_record* %scevgep to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp10, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false)
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %cmp.i = icmp sgt i32 %inc.i8, 0
  %conv.i = select i1 %cmp.i, i64 100, i64 0
  store i64 %conv.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp13
  br i1 %exitcond, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp9 = add i32 %smax, 1
  store i32 %tmp9, i32* @fetch.fetch_count, align 4
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
  store %struct.data_record* %0, %struct.data_record** @data_ptr, align 8
  tail call void @llvm.memset.p0i8.i64(i8* %call1.i, i8 -86, i64 404, i32 1, i1 false) nounwind
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %tmp.i1.i = load i32* @fetch.fetch_count, align 4
  %inc.i2.i = add nsw i32 %tmp.i1.i, 1
  store i32 %inc.i2.i, i32* @fetch.fetch_count, align 4
  %cmp.i3.i = icmp sgt i32 %tmp.i1.i, 0
  %conv.i4.i = select i1 %cmp.i3.i, i64 100, i64 0
  store i64 %conv.i4.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8
  br i1 %cmp.i3.i, label %if.then, label %while.body.lr.ph.i

while.body.lr.ph.i:                               ; preds = %entry
  %tmp.i = icmp sgt i32 %inc.i2.i, 1
  %smax.i = select i1 %tmp.i, i32 %inc.i2.i, i32 1
  %tmp4 = add i32 %smax.i, -1
  %tmp5 = sub i32 %tmp4, %tmp.i1.i
  %tmp6 = zext i32 %tmp5 to i64
  %tmp7 = add i64 %tmp6, 1
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %indvar.i = phi i64 [ %1, %while.body.i ], [ 0, %while.body.lr.ph.i ]
  %tmp9 = mul i64 %indvar.i, 404
  %tmp10.i = getelementptr i8* %call1.i, i64 %tmp9
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp10.i, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false) nounwind
  tail call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false) nounwind
  %1 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %1, %tmp7
  br i1 %exitcond, label %load_data.exit, label %while.body.i

load_data.exit:                                   ; preds = %while.body.i
  %cmp.i.i = icmp sgt i32 %smax.i, 0
  %conv.i.i = select i1 %cmp.i.i, i64 100, i64 0
  store i64 %conv.i.i, i64* getelementptr inbounds (%struct.anon* @sqlca, i64 0, i32 0), align 8
  %tmp9.i = add i32 %smax.i, 1
  store i32 %tmp9.i, i32* @fetch.fetch_count, align 4
  %dummy.phi.trans.insert = bitcast i8* %call1.i to i32*
  %tmp1.pre = load i32* %dummy.phi.trans.insert, align 4
  %phitmp = icmp eq i32 %tmp1.pre, 1431655765
  br i1 %phitmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %load_data.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %load_data.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
