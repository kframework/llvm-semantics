; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950628-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, i8, i8, i16 }

define i48 @g() nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 2
  %now = alloca %struct.T, align 2
  %tmp = alloca i48
  %hours = getelementptr inbounds %struct.T* %now, i32 0, i32 0
  store i8 1, i8* %hours, align 1
  %day = getelementptr inbounds %struct.T* %now, i32 0, i32 1
  store i8 2, i8* %day, align 1
  %month = getelementptr inbounds %struct.T* %now, i32 0, i32 2
  store i8 3, i8* %month, align 1
  %year = getelementptr inbounds %struct.T* %now, i32 0, i32 3
  store i16 4, i16* %year, align 2
  %0 = bitcast %struct.T* %retval to i8*
  %1 = bitcast %struct.T* %now to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 6, i32 2, i1 false)
  %2 = bitcast i48* %tmp to %struct.T*
  %3 = load %struct.T* %retval
  store %struct.T %3, %struct.T* %2, align 1
  %4 = load i48* %tmp
  ret i48 %4
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i48 @f() nounwind uwtable {
entry:
  %retval = alloca %struct.T, align 2
  %virk = alloca %struct.T, align 2
  %coerce = alloca %struct.T, align 2
  %tmp = alloca i48
  %tmp1 = alloca i48
  %call = call i48 @g()
  store i48 %call, i48* %tmp
  %0 = bitcast i48* %tmp to %struct.T*
  %1 = load %struct.T* %0, align 1
  store %struct.T %1, %struct.T* %coerce
  %2 = bitcast %struct.T* %virk to i8*
  %3 = bitcast %struct.T* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 6, i32 2, i1 false)
  %4 = bitcast %struct.T* %retval to i8*
  %5 = bitcast %struct.T* %virk to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 6, i32 2, i1 false)
  %6 = bitcast i48* %tmp1 to %struct.T*
  %7 = load %struct.T* %retval
  store %struct.T %7, %struct.T* %6, align 1
  %8 = load i48* %tmp1
  ret i48 %8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %coerce = alloca %struct.T, align 2
  %tmp = alloca i48
  %coerce3 = alloca %struct.T, align 2
  %tmp4 = alloca i48
  %coerce10 = alloca %struct.T, align 2
  %tmp11 = alloca i48
  %coerce17 = alloca %struct.T, align 2
  %tmp18 = alloca i48
  store i32 0, i32* %retval
  %call = call i48 @f()
  store i48 %call, i48* %tmp
  %0 = bitcast i48* %tmp to %struct.T*
  %1 = load %struct.T* %0, align 1
  store %struct.T %1, %struct.T* %coerce
  %hours = getelementptr inbounds %struct.T* %coerce, i32 0, i32 0
  %2 = load i8* %hours, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %call2 = call i48 @f()
  store i48 %call2, i48* %tmp4
  %3 = bitcast i48* %tmp4 to %struct.T*
  %4 = load %struct.T* %3, align 1
  store %struct.T %4, %struct.T* %coerce3
  %day = getelementptr inbounds %struct.T* %coerce3, i32 0, i32 1
  %5 = load i8* %day, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp ne i32 %conv5, 2
  br i1 %cmp6, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %call9 = call i48 @f()
  store i48 %call9, i48* %tmp11
  %6 = bitcast i48* %tmp11 to %struct.T*
  %7 = load %struct.T* %6, align 1
  store %struct.T %7, %struct.T* %coerce10
  %month = getelementptr inbounds %struct.T* %coerce10, i32 0, i32 2
  %8 = load i8* %month, align 1
  %conv12 = sext i8 %8 to i32
  %cmp13 = icmp ne i32 %conv12, 3
  br i1 %cmp13, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false8
  %call16 = call i48 @f()
  store i48 %call16, i48* %tmp18
  %9 = bitcast i48* %tmp18 to %struct.T*
  %10 = load %struct.T* %9, align 1
  store %struct.T %10, %struct.T* %coerce17
  %year = getelementptr inbounds %struct.T* %coerce17, i32 0, i32 3
  %11 = load i16* %year, align 2
  %conv19 = sext i16 %11 to i32
  %cmp20 = icmp ne i32 %conv19, 4
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false15, %lor.lhs.false8, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false15
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %12 = load i32* %retval
  ret i32 %12
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
