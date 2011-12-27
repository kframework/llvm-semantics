; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { i8*, i32, i32 }

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

define %struct.t* @f(%struct.t* %clas, i32 %size) nounwind uwtable {
entry:
  %clas.addr = alloca %struct.t*, align 8
  %size.addr = alloca i32, align 4
  %child = alloca %struct.t*, align 8
  store %struct.t* %clas, %struct.t** %clas.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %tmp = load i32* %size.addr, align 4
  %conv = sext i32 %tmp to i64
  %call = call noalias i8* @malloc(i64 %conv) nounwind
  %0 = bitcast i8* %call to %struct.t*
  store %struct.t* %0, %struct.t** %child, align 8
  %tmp1 = load %struct.t** %child, align 8
  %1 = bitcast %struct.t* %tmp1 to i8*
  %tmp2 = load %struct.t** %clas.addr, align 8
  %2 = bitcast %struct.t* %tmp2 to i8*
  %tmp3 = load %struct.t** %clas.addr, align 8
  %size4 = getelementptr inbounds %struct.t* %tmp3, i32 0, i32 2
  %tmp5 = load i32* %size4, align 4
  %conv6 = sext i32 %tmp5 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 %conv6, i32 1, i1 false)
  %tmp7 = load %struct.t** %clas.addr, align 8
  %3 = bitcast %struct.t* %tmp7 to i8*
  %tmp8 = load %struct.t** %child, align 8
  %super = getelementptr inbounds %struct.t* %tmp8, i32 0, i32 0
  store i8* %3, i8** %super, align 8
  %tmp9 = load %struct.t** %child, align 8
  %name = getelementptr inbounds %struct.t* %tmp9, i32 0, i32 1
  store i32 0, i32* %name, align 4
  %tmp10 = load i32* %size.addr, align 4
  %tmp11 = load %struct.t** %child, align 8
  %size12 = getelementptr inbounds %struct.t* %tmp11, i32 0, i32 2
  store i32 %tmp10, i32* %size12, align 4
  %tmp13 = load %struct.t** %child, align 8
  ret %struct.t* %tmp13
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %foo = alloca %struct.t, align 8
  %bar = alloca %struct.t*, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.t* %foo to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 37, i64 16, i32 1, i1 false)
  %size = getelementptr inbounds %struct.t* %foo, i32 0, i32 2
  store i32 16, i32* %size, align 4
  %call = call %struct.t* @f(%struct.t* %foo, i32 16)
  store %struct.t* %call, %struct.t** %bar, align 8
  %tmp = load %struct.t** %bar, align 8
  %super = getelementptr inbounds %struct.t* %tmp, i32 0, i32 0
  %tmp1 = load i8** %super, align 8
  %1 = bitcast %struct.t* %foo to i8*
  %cmp = icmp ne i8* %tmp1, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load %struct.t** %bar, align 8
  %name = getelementptr inbounds %struct.t* %tmp2, i32 0, i32 1
  %tmp3 = load i32* %name, align 4
  %cmp4 = icmp ne i32 %tmp3, 0
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load %struct.t** %bar, align 8
  %size7 = getelementptr inbounds %struct.t* %tmp6, i32 0, i32 2
  %tmp8 = load i32* %size7, align 4
  %conv = sext i32 %tmp8 to i64
  %cmp9 = icmp ne i64 %conv, 16
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
