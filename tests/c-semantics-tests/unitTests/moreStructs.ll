; ModuleID = '/home/david/src/c-semantics/tests/unitTests/moreStructs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { i32, i32 }
%struct.A = type { i32, %struct.B }

@.str = private unnamed_addr constant [12 x i8] c"in main():\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@f.b = private unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4
@.str2 = private unnamed_addr constant [9 x i8] c"in f():\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"b.x = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"b.y = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %tmp = alloca { i64, i32 }
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call { i64, i32 } @f()
  store { i64, i32 } %call, { i64, i32 }* %tmp
  %0 = bitcast { i64, i32 }* %tmp to %struct.A*
  %1 = load %struct.A* %0, align 1
  store %struct.A %1, %struct.A* %a
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %2 = load i32* %z, align 4
  store i32 %2, i32* %test1, align 4
  %b = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %3 = load i32* %x, align 4
  store i32 %3, i32* %test2, align 4
  %b5 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y = getelementptr inbounds %struct.B* %b5, i32 0, i32 1
  %4 = load i32* %y, align 4
  store i32 %4, i32* %test3, align 4
  %5 = load i32* %test1, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %5)
  %6 = load i32* %test2, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %6)
  %7 = load i32* %test3, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %7)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define internal { i64, i32 } @f() nounwind uwtable {
entry:
  %retval = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  %tmp = alloca { i64, i32 }
  %0 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %z, align 4
  %b1 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %1 = bitcast %struct.B* %b1 to i8*
  %2 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 8, i32 4, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %3 = load i32* %x, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0), i32 %3)
  %y = getelementptr inbounds %struct.B* %b, i32 0, i32 1
  %4 = load i32* %y, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i32 %4)
  %z4 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %5 = load i32* %z4, align 4
  store i32 %5, i32* %test1, align 4
  %b5 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x6 = getelementptr inbounds %struct.B* %b5, i32 0, i32 0
  %6 = load i32* %x6, align 4
  store i32 %6, i32* %test2, align 4
  %b7 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y8 = getelementptr inbounds %struct.B* %b7, i32 0, i32 1
  %7 = load i32* %y8, align 4
  store i32 %7, i32* %test3, align 4
  %8 = load i32* %test1, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %8)
  %9 = load i32* %test2, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %9)
  %10 = load i32* %test3, align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %10)
  %11 = bitcast %struct.A* %retval to i8*
  %12 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 12, i32 4, i1 false)
  %13 = bitcast { i64, i32 }* %tmp to %struct.A*
  %14 = load %struct.A* %retval
  store %struct.A %14, %struct.A* %13, align 1
  %15 = load { i64, i32 }* %tmp
  ret { i64, i32 } %15
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
