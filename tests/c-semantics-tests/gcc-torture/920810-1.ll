; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.t = type { i8*, i32, i32 }

define %struct.t* @f(%struct.t* %clas, i32 %size) nounwind uwtable {
entry:
  %clas.addr = alloca %struct.t*, align 8
  %size.addr = alloca i32, align 4
  %child = alloca %struct.t*, align 8
  store %struct.t* %clas, %struct.t** %clas.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32* %size.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias i8* @malloc(i64 %conv) nounwind
  %1 = bitcast i8* %call to %struct.t*
  store %struct.t* %1, %struct.t** %child, align 8
  %2 = load %struct.t** %child, align 8
  %3 = bitcast %struct.t* %2 to i8*
  %4 = load %struct.t** %clas.addr, align 8
  %5 = bitcast %struct.t* %4 to i8*
  %6 = load %struct.t** %clas.addr, align 8
  %size1 = getelementptr inbounds %struct.t* %6, i32 0, i32 2
  %7 = load i32* %size1, align 4
  %conv2 = sext i32 %7 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %5, i64 %conv2, i32 8, i1 false)
  %8 = load %struct.t** %clas.addr, align 8
  %9 = bitcast %struct.t* %8 to i8*
  %10 = load %struct.t** %child, align 8
  %super = getelementptr inbounds %struct.t* %10, i32 0, i32 0
  store i8* %9, i8** %super, align 8
  %11 = load %struct.t** %child, align 8
  %name = getelementptr inbounds %struct.t* %11, i32 0, i32 1
  store i32 0, i32* %name, align 4
  %12 = load i32* %size.addr, align 4
  %13 = load %struct.t** %child, align 8
  %size3 = getelementptr inbounds %struct.t* %13, i32 0, i32 2
  store i32 %12, i32* %size3, align 4
  %14 = load %struct.t** %child, align 8
  ret %struct.t* %14
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
  call void @llvm.memset.p0i8.i64(i8* %0, i8 37, i64 16, i32 8, i1 false)
  %size = getelementptr inbounds %struct.t* %foo, i32 0, i32 2
  store i32 16, i32* %size, align 4
  %call = call %struct.t* @f(%struct.t* %foo, i32 16)
  store %struct.t* %call, %struct.t** %bar, align 8
  %1 = load %struct.t** %bar, align 8
  %super = getelementptr inbounds %struct.t* %1, i32 0, i32 0
  %2 = load i8** %super, align 8
  %3 = bitcast %struct.t* %foo to i8*
  %cmp = icmp ne i8* %2, %3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load %struct.t** %bar, align 8
  %name = getelementptr inbounds %struct.t* %4, i32 0, i32 1
  %5 = load i32* %name, align 4
  %cmp1 = icmp ne i32 %5, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %6 = load %struct.t** %bar, align 8
  %size3 = getelementptr inbounds %struct.t* %6, i32 0, i32 2
  %7 = load i32* %size3, align 4
  %conv = sext i32 %7 to i64
  %cmp4 = icmp ne i64 %conv, 16
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
