; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i64 }
%struct.data_record = type { i32, [100 x i32] }

@fetch.fetch_count = internal global i32 0, align 4
@data_tmp = common global %struct.data_record zeroinitializer, align 4
@sqlca = common global %struct.anon zeroinitializer, align 8
@data_ptr = common global %struct.data_record* null, align 8

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @num_records() nounwind uwtable {
entry:
  ret i32 1
}

define void @fetch() nounwind uwtable {
entry:
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 1, i1 false)
  %tmp = load i32* @fetch.fetch_count, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @fetch.fetch_count, align 4
  %cmp = icmp sgt i32 %inc, 1
  %cond = select i1 %cmp, i32 100, i32 0
  %conv = sext i32 %cond to i64
  store i64 %conv, i64* getelementptr inbounds (%struct.anon* @sqlca, i32 0, i32 0), align 8
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @load_data() nounwind uwtable {
entry:
  %p = alloca %struct.data_record*, align 8
  %num = alloca i32, align 4
  %call = call i32 @num_records()
  store i32 %call, i32* %num, align 4
  %tmp = load i32* %num, align 4
  %conv = sext i32 %tmp to i64
  %mul = mul i64 %conv, 404
  %call1 = call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call1 to %struct.data_record*
  store %struct.data_record* %0, %struct.data_record** @data_ptr, align 8
  %tmp2 = load %struct.data_record** @data_ptr, align 8
  %1 = bitcast %struct.data_record* %tmp2 to i8*
  %tmp3 = load i32* %num, align 4
  %conv4 = sext i32 %tmp3 to i64
  %mul5 = mul i64 %conv4, 404
  call void @llvm.memset.p0i8.i64(i8* %1, i8 -86, i64 %mul5, i32 1, i1 false)
  call void @fetch()
  %tmp6 = load %struct.data_record** @data_ptr, align 8
  store %struct.data_record* %tmp6, %struct.data_record** %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp7 = load i64* getelementptr inbounds (%struct.anon* @sqlca, i32 0, i32 0), align 8
  %cmp = icmp eq i64 %tmp7, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp9 = load %struct.data_record** %p, align 8
  %incdec.ptr = getelementptr inbounds %struct.data_record* %tmp9, i32 1
  store %struct.data_record* %incdec.ptr, %struct.data_record** %p, align 8
  %tmp10 = bitcast %struct.data_record* %tmp9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp10, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false)
  call void @fetch()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @load_data()
  %tmp = load %struct.data_record** @data_ptr, align 8
  %arrayidx = getelementptr inbounds %struct.data_record* %tmp, i64 0
  %dummy = getelementptr inbounds %struct.data_record* %arrayidx, i32 0, i32 0
  %tmp1 = load i32* %dummy, align 4
  %cmp = icmp ne i32 %tmp1, 1431655765
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
