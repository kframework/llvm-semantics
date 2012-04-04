; ModuleID = '/home/david/src/c-semantics/tests/integration/PALSmiddleware.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.cbuffer_t = type { i32, i32, i32, i8* }
%struct.A = type { i8, i8 }

@mbuf = common global %struct.cbuffer_t zeroinitializer, align 8
@a1 = common global %struct.A zeroinitializer, align 1
@arr = common global [20 x i8] zeroinitializer, align 16
@a2 = common global %struct.A zeroinitializer, align 1

define void @cbuffer_init(%struct.cbuffer_t* nocapture %buf, i8* %arr, i32 %size) nounwind uwtable {
entry:
  %buf1 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  store i8* %arr, i8** %buf1, align 8, !tbaa !0
  %maxBufSize = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 2
  store i32 %size, i32* %maxBufSize, align 4, !tbaa !3
  %len = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 0
  store i32 0, i32* %len, align 4, !tbaa !3
  %ptr = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 1
  store i32 0, i32* %ptr, align 4, !tbaa !3
  ret void
}

define i32 @cbuffer_append_int8(%struct.cbuffer_t* nocapture %buf, i8 signext %n) nounwind uwtable {
entry:
  %buf1 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  %0 = load i8** %buf1, align 8, !tbaa !0
  %len = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 0
  %1 = load i32* %len, align 4, !tbaa !3
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8* %0, i64 %idx.ext
  store i8 %n, i8* %add.ptr, align 1, !tbaa !1
  %2 = load i32* %len, align 4, !tbaa !3
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %len, align 4, !tbaa !3
  ret i32 1
}

define i32 @cbuffer_retrieve_int8(%struct.cbuffer_t* nocapture %buf, i8* nocapture %n) nounwind uwtable {
entry:
  %buf1 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  %0 = load i8** %buf1, align 8, !tbaa !0
  %ptr = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 1
  %1 = load i32* %ptr, align 4, !tbaa !3
  %idx.ext = sext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8* %0, i64 %idx.ext
  %2 = load i8* %add.ptr, align 1, !tbaa !1
  store i8 %2, i8* %n, align 1, !tbaa !1
  %3 = load i32* %ptr, align 4, !tbaa !3
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %ptr, align 4, !tbaa !3
  ret i32 1
}

define i32 @main() nounwind uwtable {
cond.end:
  store i8 97, i8* getelementptr inbounds (%struct.A* @a1, i64 0, i32 0), align 1, !tbaa !1
  store i8 98, i8* getelementptr inbounds (%struct.A* @a1, i64 0, i32 1), align 1, !tbaa !1
  store i8* getelementptr inbounds ([20 x i8]* @arr, i64 0, i64 0), i8** getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 3), align 8, !tbaa !0
  store i32 20, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 2), align 8, !tbaa !3
  store i8 97, i8* getelementptr inbounds ([20 x i8]* @arr, i64 0, i64 0), align 16, !tbaa !1
  store i32 1, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 0), align 8, !tbaa !3
  store i8 97, i8* getelementptr inbounds (%struct.A* @a2, i64 0, i32 0), align 1, !tbaa !1
  store i32 1, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 1), align 4, !tbaa !3
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
