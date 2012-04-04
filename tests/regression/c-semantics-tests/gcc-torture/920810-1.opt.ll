; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { i8*, i32, i32 }

define noalias %struct.t* @f(%struct.t* %clas, i32 %size) nounwind uwtable {
entry:
  %conv = sext i32 %size to i64
  %call = tail call noalias i8* @malloc(i64 %conv) nounwind
  %0 = bitcast i8* %call to %struct.t*
  %1 = bitcast %struct.t* %clas to i8*
  %size1 = getelementptr inbounds %struct.t* %clas, i64 0, i32 2
  %2 = load i32* %size1, align 4, !tbaa !0
  %conv2 = sext i32 %2 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call, i8* %1, i64 %conv2, i32 8, i1 false)
  %super = bitcast i8* %call to i8**
  store i8* %1, i8** %super, align 8, !tbaa !3
  %name = getelementptr inbounds i8* %call, i64 8
  %3 = bitcast i8* %name to i32*
  store i32 0, i32* %3, align 4, !tbaa !0
  %size3 = getelementptr inbounds i8* %call, i64 12
  %4 = bitcast i8* %size3 to i32*
  store i32 %size, i32* %4, align 4, !tbaa !0
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
  store i32 16, i32* %size, align 4, !tbaa !0
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
