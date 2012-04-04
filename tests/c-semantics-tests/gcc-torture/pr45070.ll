; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr45070.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.source = type { i32, i32, i32 }
%struct.packed_ushort = type <{ i16 }>

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.source, align 4
  %i = alloca i32, align 4
  %rv = alloca %struct.packed_ushort, align 1
  store i32 0, i32* %retval
  %pos = getelementptr inbounds %struct.source* %s, i32 0, i32 0
  store i32 0, i32* %pos, align 4
  %length = getelementptr inbounds %struct.source* %s, i32 0, i32 1
  store i32 0, i32* %length, align 4
  %flag = getelementptr inbounds %struct.source* %s, i32 0, i32 2
  store i32 0, i32* %flag, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i16 @next(%struct.source* %s)
  %coerce.dive = getelementptr %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 %call, i16* %coerce.dive
  %1 = load i32* %i, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %ucs = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  %2 = load i16* %ucs, align 1
  %conv = zext i16 %2 to i32
  %cmp2 = icmp ne i32 %conv, 65535
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %3 = load i32* %i, align 4
  %cmp4 = icmp sgt i32 %3, 0
  br i1 %cmp4, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %lor.lhs.false
  %ucs7 = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  %4 = load i16* %ucs7, align 1
  %conv8 = zext i16 %4 to i32
  %cmp9 = icmp ne i32 %conv8, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true6, %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true6, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal i16 @next(%struct.source* %p) nounwind uwtable noinline {
entry:
  %retval = alloca %struct.packed_ushort, align 1
  %p.addr = alloca %struct.source*, align 8
  %rv = alloca %struct.packed_ushort, align 1
  store %struct.source* %p, %struct.source** %p.addr, align 8
  %0 = load %struct.source** %p.addr, align 8
  %pos = getelementptr inbounds %struct.source* %0, i32 0, i32 0
  %1 = load i32* %pos, align 4
  %2 = load %struct.source** %p.addr, align 8
  %length = getelementptr inbounds %struct.source* %2, i32 0, i32 1
  %3 = load i32* %length, align 4
  %cmp = icmp sge i32 %1, %3
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %4 = load %struct.source** %p.addr, align 8
  %flag = getelementptr inbounds %struct.source* %4, i32 0, i32 2
  %5 = load i32* %flag, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %6 = load %struct.source** %p.addr, align 8
  %flag2 = getelementptr inbounds %struct.source* %6, i32 0, i32 2
  store i32 0, i32* %flag2, align 4
  %7 = load %struct.source** %p.addr, align 8
  call void @fetch(%struct.source* %7)
  %8 = load %struct.source** %p.addr, align 8
  %call = call i16 @next(%struct.source* %8)
  %coerce.dive = getelementptr %struct.packed_ushort* %retval, i32 0, i32 0
  store i16 %call, i16* %coerce.dive
  br label %return

if.end:                                           ; preds = %if.then
  %9 = load %struct.source** %p.addr, align 8
  %flag3 = getelementptr inbounds %struct.source* %9, i32 0, i32 2
  store i32 1, i32* %flag3, align 4
  %ucs = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 -1, i16* %ucs, align 1
  %10 = bitcast %struct.packed_ushort* %retval to i8*
  %11 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 2, i32 1, i1 false)
  br label %return

if.end4:                                          ; preds = %entry
  %ucs5 = getelementptr inbounds %struct.packed_ushort* %rv, i32 0, i32 0
  store i16 0, i16* %ucs5, align 1
  %12 = bitcast %struct.packed_ushort* %retval to i8*
  %13 = bitcast %struct.packed_ushort* %rv to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 2, i32 1, i1 false)
  br label %return

return:                                           ; preds = %if.end4, %if.end, %if.then1
  %coerce.dive6 = getelementptr %struct.packed_ushort* %retval, i32 0, i32 0
  %14 = load i16* %coerce.dive6
  ret i16 %14
}

declare void @abort() noreturn nounwind

define internal void @fetch(%struct.source* %p) nounwind uwtable noinline {
entry:
  %p.addr = alloca %struct.source*, align 8
  store %struct.source* %p, %struct.source** %p.addr, align 8
  %0 = load %struct.source** %p.addr, align 8
  %length = getelementptr inbounds %struct.source* %0, i32 0, i32 1
  store i32 128, i32* %length, align 4
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
