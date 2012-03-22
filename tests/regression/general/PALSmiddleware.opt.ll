; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/PALSmiddleware.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i8, i8 }
%struct.cbuffer_t = type { i32, i32, i32, i8* }

@mbuf = common global %struct.cbuffer_t zeroinitializer, align 8
@a1 = common global %struct.A zeroinitializer, align 1
@arr = common global [20 x i8] zeroinitializer, align 16
@a2 = common global %struct.A zeroinitializer, align 1

define void @cbuffer_init(%struct.cbuffer_t* %buf, i8* %arr, i32 %size) nounwind uwtable {
entry:
  %buf2 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  store i8* %arr, i8** %buf2, align 8
  %maxBufSize = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 2
  store i32 %size, i32* %maxBufSize, align 4
  %len = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 0
  store i32 0, i32* %len, align 4
  %ptr = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 1
  store i32 0, i32* %ptr, align 4
  ret void
}

define i32 @cbuffer_append_int8(%struct.cbuffer_t* %buf, i8 signext %n) nounwind uwtable {
entry:
  %buf2 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  %tmp3 = load i8** %buf2, align 8
  %len = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 0
  %tmp5 = load i32* %len, align 4
  %idx.ext = sext i32 %tmp5 to i64
  %add.ptr = getelementptr inbounds i8* %tmp3, i64 %idx.ext
  store i8 %n, i8* %add.ptr, align 1
  %tmp8 = load i32* %len, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %len, align 4
  ret i32 1
}

define i32 @cbuffer_retrieve_int8(%struct.cbuffer_t* %buf, i8* %n) nounwind uwtable {
entry:
  %buf1 = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 3
  %tmp2 = load i8** %buf1, align 8
  %ptr = getelementptr inbounds %struct.cbuffer_t* %buf, i64 0, i32 1
  %tmp4 = load i32* %ptr, align 4
  %idx.ext = sext i32 %tmp4 to i64
  %add.ptr = getelementptr inbounds i8* %tmp2, i64 %idx.ext
  %tmp5 = load i8* %add.ptr, align 1
  store i8 %tmp5, i8* %n, align 1
  %tmp9 = load i32* %ptr, align 4
  %inc = add nsw i32 %tmp9, 1
  store i32 %inc, i32* %ptr, align 4
  ret i32 1
}

define i32 @main() nounwind uwtable {
cond.end:
  store i8 97, i8* getelementptr inbounds (%struct.A* @a1, i64 0, i32 0), align 1
  store i8 98, i8* getelementptr inbounds (%struct.A* @a1, i64 0, i32 1), align 1
  store i8* getelementptr inbounds ([20 x i8]* @arr, i64 0, i64 0), i8** getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 3), align 8
  store i32 20, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 2), align 8
  store i8 97, i8* getelementptr inbounds ([20 x i8]* @arr, i64 0, i64 0), align 16
  store i32 1, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 0), align 8
  store i8 97, i8* getelementptr inbounds (%struct.A* @a2, i64 0, i32 0), align 1
  store i32 1, i32* getelementptr inbounds (%struct.cbuffer_t* @mbuf, i64 0, i32 1), align 4
  ret i32 0
}
