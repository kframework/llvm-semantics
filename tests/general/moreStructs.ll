; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/moreStructs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.A = type { i32, %struct.B }
%struct.B = type { i32, i32 }

@.str = private unnamed_addr constant [12 x i8] c"in main():\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@f.b = internal unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4
@.str2 = private unnamed_addr constant [9 x i8] c"in f():\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"b.x = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"b.y = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %tmp = alloca %0
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call %0 @f()
  store %0 %call, %0* %tmp
  %0 = bitcast %0* %tmp to %struct.A*
  %1 = load %struct.A* %0, align 1
  store %struct.A %1, %struct.A* %a
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %tmp3 = load i32* %z, align 4
  store i32 %tmp3, i32* %test1, align 4
  %b = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %tmp5 = load i32* %x, align 4
  store i32 %tmp5, i32* %test2, align 4
  %b7 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y = getelementptr inbounds %struct.B* %b7, i32 0, i32 1
  %tmp8 = load i32* %y, align 4
  store i32 %tmp8, i32* %test3, align 4
  %tmp9 = load i32* %test1, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* %test2, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load i32* %test3, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp13)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define internal %0 @f() nounwind uwtable {
entry:
  %retval = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  %tmp28 = alloca %0
  %tmp = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %z, align 4
  %b2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %tmp3 = bitcast %struct.B* %b2 to i8*
  %tmp4 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 8, i32 4, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %tmp5 = load i32* %x, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0), i32 %tmp5)
  %y = getelementptr inbounds %struct.B* %b, i32 0, i32 1
  %tmp7 = load i32* %y, align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %z10 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %tmp11 = load i32* %z10, align 4
  store i32 %tmp11, i32* %test1, align 4
  %b13 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x14 = getelementptr inbounds %struct.B* %b13, i32 0, i32 0
  %tmp15 = load i32* %x14, align 4
  store i32 %tmp15, i32* %test2, align 4
  %b17 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y18 = getelementptr inbounds %struct.B* %b17, i32 0, i32 1
  %tmp19 = load i32* %y18, align 4
  store i32 %tmp19, i32* %test3, align 4
  %tmp20 = load i32* %test1, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* %test2, align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* %test3, align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %tmp24)
  %tmp26 = bitcast %struct.A* %retval to i8*
  %tmp27 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 12, i32 4, i1 false)
  %0 = bitcast %0* %tmp28 to %struct.A*
  %1 = load %struct.A* %retval
  store %struct.A %1, %struct.A* %0, align 1
  %2 = load %0* %tmp28
  ret %0 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
