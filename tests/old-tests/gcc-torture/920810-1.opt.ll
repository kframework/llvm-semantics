; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920810-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { i8*, i32, i32 }

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

define %struct.t* @f(%struct.t* %clas, i32 %size) nounwind uwtable {
entry:
  %conv = sext i32 %size to i64
  %call = tail call noalias i8* @malloc(i64 %conv) nounwind
  %0 = bitcast i8* %call to %struct.t*
  %1 = bitcast %struct.t* %clas to i8*
  %size4 = getelementptr inbounds %struct.t* %clas, i64 0, i32 2
  %tmp5 = load i32* %size4, align 4
  %conv6 = sext i32 %tmp5 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call, i8* %1, i64 %conv6, i32 1, i1 false)
  %super = bitcast i8* %call to i8**
  store i8* %1, i8** %super, align 8
  %name = getelementptr inbounds i8* %call, i64 8
  %2 = bitcast i8* %name to i32*
  store i32 0, i32* %2, align 4
  %size12 = getelementptr inbounds i8* %call, i64 12
  %3 = bitcast i8* %size12 to i32*
  store i32 %size, i32* %3, align 4
  ret %struct.t* %0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() noreturn nounwind uwtable {
if.end:
  %foo = alloca %struct.t, align 8
  %0 = bitcast %struct.t* %foo to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 37, i64 16, i32 8, i1 false)
  %size = getelementptr inbounds %struct.t* %foo, i64 0, i32 2
  store i32 16, i32* %size, align 4
  %call.i = call noalias i8* @malloc(i64 16) nounwind
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call.i, i8* %0, i64 16, i32 1, i1 false) nounwind
  %super.i = bitcast i8* %call.i to i8**
  store i8* %0, i8** %super.i, align 8
  %name.i = getelementptr inbounds i8* %call.i, i64 8
  %1 = bitcast i8* %name.i to i32*
  store i32 0, i32* %1, align 4
  %size12.i = getelementptr inbounds i8* %call.i, i64 12
  %2 = bitcast i8* %size12.i to i32*
  store i32 16, i32* %2, align 4
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind
