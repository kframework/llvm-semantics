; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.data_record = type { i32, [100 x i32] }
%struct.anon = type { i64 }

@fetch.fetch_count = internal global i32 0, align 4
@data_tmp = common global %struct.data_record zeroinitializer, align 4
@sqlca = common global %struct.anon zeroinitializer, align 8
@data_ptr = common global %struct.data_record* null, align 8

define i32 @num_records() nounwind uwtable {
entry:
  ret i32 1
}

define void @fetch() nounwind uwtable {
entry:
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.data_record* @data_tmp to i8*), i8 85, i64 404, i32 4, i1 false)
  %0 = load i32* @fetch.fetch_count, align 4
  %inc = add nsw i32 %0, 1
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
  %0 = load i32* %num, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 404
  %call1 = call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call1 to %struct.data_record*
  store %struct.data_record* %1, %struct.data_record** @data_ptr, align 8
  %2 = load %struct.data_record** @data_ptr, align 8
  %3 = bitcast %struct.data_record* %2 to i8*
  %4 = load i32* %num, align 4
  %conv2 = sext i32 %4 to i64
  %mul3 = mul i64 %conv2, 404
  call void @llvm.memset.p0i8.i64(i8* %3, i8 -86, i64 %mul3, i32 4, i1 false)
  call void @fetch()
  %5 = load %struct.data_record** @data_ptr, align 8
  store %struct.data_record* %5, %struct.data_record** %p, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %6 = load i64* getelementptr inbounds (%struct.anon* @sqlca, i32 0, i32 0), align 8
  %cmp = icmp eq i64 %6, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load %struct.data_record** %p, align 8
  %incdec.ptr = getelementptr inbounds %struct.data_record* %7, i32 1
  store %struct.data_record* %incdec.ptr, %struct.data_record** %p, align 8
  %8 = bitcast %struct.data_record* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast (%struct.data_record* @data_tmp to i8*), i64 404, i32 4, i1 false)
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
  %0 = load %struct.data_record** @data_ptr, align 8
  %arrayidx = getelementptr inbounds %struct.data_record* %0, i64 0
  %dummy = getelementptr inbounds %struct.data_record* %arrayidx, i32 0, i32 0
  %1 = load i32* %dummy, align 4
  %cmp = icmp ne i32 %1, 1431655765
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
