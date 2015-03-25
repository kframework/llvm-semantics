; ModuleID = './schorr-waite.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.struct_node = type <{ i8, [7 x i8], %struct.struct_node*, %struct.struct_node*, i32, [4 x i8] }>

@counter = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"creating new node %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"Setting left child of %d to %d\0A\00", align 1
@.str2 = private unnamed_addr constant [33 x i8] c"Setting right child of %d to %d\0A\00", align 1
@.str3 = private unnamed_addr constant [19 x i8] c"%d:m=%d:l=%d:r=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"Now running Schorr-Waite...\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @schorr_waite(%struct.struct_node* %root) #0 {
  %1 = alloca %struct.struct_node*, align 8
  %t = alloca %struct.struct_node*, align 8
  %p = alloca %struct.struct_node*, align 8
  %q = alloca %struct.struct_node*, align 8
  %q1 = alloca %struct.struct_node*, align 8
  %q2 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %root, %struct.struct_node** %1, align 8
  %2 = load %struct.struct_node** %1, align 8
  store %struct.struct_node* %2, %struct.struct_node** %t, align 8
  store %struct.struct_node* null, %struct.struct_node** %p, align 8
  br label %3

; <label>:3                                       ; preds = %85, %0
  %4 = load %struct.struct_node** %p, align 8
  %5 = icmp ne %struct.struct_node* %4, null
  br i1 %5, label %19, label %6

; <label>:6                                       ; preds = %3
  %7 = load %struct.struct_node** %t, align 8
  %8 = icmp ne %struct.struct_node* %7, null
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = load %struct.struct_node** %t, align 8
  %11 = bitcast %struct.struct_node* %10 to i8*
  %12 = load i8* %11, align 8
  %13 = and i8 %12, 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  %16 = xor i1 %15, true
  br label %17

; <label>:17                                      ; preds = %9, %6
  %18 = phi i1 [ false, %6 ], [ %16, %9 ]
  br label %19

; <label>:19                                      ; preds = %17, %3
  %20 = phi i1 [ true, %3 ], [ %18, %17 ]
  br i1 %20, label %21, label %86

; <label>:21                                      ; preds = %19
  %22 = load %struct.struct_node** %t, align 8
  %23 = icmp eq %struct.struct_node* %22, null
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %21
  %25 = load %struct.struct_node** %t, align 8
  %26 = bitcast %struct.struct_node* %25 to i8*
  %27 = load i8* %26, align 8
  %28 = and i8 %27, 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %67

; <label>:31                                      ; preds = %24, %21
  %32 = load %struct.struct_node** %p, align 8
  %33 = bitcast %struct.struct_node* %32 to i8*
  %34 = load i8* %33, align 8
  %35 = lshr i8 %34, 1
  %36 = and i8 %35, 1
  %37 = zext i8 %36 to i32
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %48

; <label>:39                                      ; preds = %31
  %40 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %40, %struct.struct_node** %q, align 8
  %41 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %41, %struct.struct_node** %t, align 8
  %42 = load %struct.struct_node** %p, align 8
  %43 = getelementptr inbounds %struct.struct_node* %42, i32 0, i32 3
  %44 = load %struct.struct_node** %43, align 8
  store %struct.struct_node* %44, %struct.struct_node** %p, align 8
  %45 = load %struct.struct_node** %q, align 8
  %46 = load %struct.struct_node** %t, align 8
  %47 = getelementptr inbounds %struct.struct_node* %46, i32 0, i32 3
  store %struct.struct_node* %45, %struct.struct_node** %47, align 8
  br label %66

; <label>:48                                      ; preds = %31
  %49 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %49, %struct.struct_node** %q1, align 8
  %50 = load %struct.struct_node** %p, align 8
  %51 = getelementptr inbounds %struct.struct_node* %50, i32 0, i32 3
  %52 = load %struct.struct_node** %51, align 8
  store %struct.struct_node* %52, %struct.struct_node** %t, align 8
  %53 = load %struct.struct_node** %p, align 8
  %54 = getelementptr inbounds %struct.struct_node* %53, i32 0, i32 2
  %55 = load %struct.struct_node** %54, align 8
  %56 = load %struct.struct_node** %p, align 8
  %57 = getelementptr inbounds %struct.struct_node* %56, i32 0, i32 3
  store %struct.struct_node* %55, %struct.struct_node** %57, align 8
  %58 = load %struct.struct_node** %q1, align 8
  %59 = load %struct.struct_node** %p, align 8
  %60 = getelementptr inbounds %struct.struct_node* %59, i32 0, i32 2
  store %struct.struct_node* %58, %struct.struct_node** %60, align 8
  %61 = load %struct.struct_node** %p, align 8
  %62 = bitcast %struct.struct_node* %61 to i8*
  %63 = load i8* %62, align 8
  %64 = and i8 %63, -3
  %65 = or i8 %64, 2
  store i8 %65, i8* %62, align 8
  br label %66

; <label>:66                                      ; preds = %48, %39
  br label %85

; <label>:67                                      ; preds = %24
  %68 = load %struct.struct_node** %p, align 8
  store %struct.struct_node* %68, %struct.struct_node** %q2, align 8
  %69 = load %struct.struct_node** %t, align 8
  store %struct.struct_node* %69, %struct.struct_node** %p, align 8
  %70 = load %struct.struct_node** %t, align 8
  %71 = getelementptr inbounds %struct.struct_node* %70, i32 0, i32 2
  %72 = load %struct.struct_node** %71, align 8
  store %struct.struct_node* %72, %struct.struct_node** %t, align 8
  %73 = load %struct.struct_node** %q2, align 8
  %74 = load %struct.struct_node** %p, align 8
  %75 = getelementptr inbounds %struct.struct_node* %74, i32 0, i32 2
  store %struct.struct_node* %73, %struct.struct_node** %75, align 8
  %76 = load %struct.struct_node** %p, align 8
  %77 = bitcast %struct.struct_node* %76 to i8*
  %78 = load i8* %77, align 8
  %79 = and i8 %78, -2
  %80 = or i8 %79, 1
  store i8 %80, i8* %77, align 8
  %81 = load %struct.struct_node** %p, align 8
  %82 = bitcast %struct.struct_node* %81 to i8*
  %83 = load i8* %82, align 8
  %84 = and i8 %83, -3
  store i8 %84, i8* %82, align 8
  br label %85

; <label>:85                                      ; preds = %67, %66
  br label %3

; <label>:86                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.struct_node* @createNode() #0 {
  %newNode = alloca %struct.struct_node*, align 8
  %1 = load i32* @counter, align 4
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %1)
  %3 = call noalias i8* @malloc(i64 32) #3
  %4 = bitcast i8* %3 to %struct.struct_node*
  store %struct.struct_node* %4, %struct.struct_node** %newNode, align 8
  %5 = load %struct.struct_node** %newNode, align 8
  %6 = bitcast %struct.struct_node* %5 to i8*
  %7 = load i8* %6, align 8
  %8 = and i8 %7, -3
  store i8 %8, i8* %6, align 8
  %9 = load %struct.struct_node** %newNode, align 8
  %10 = bitcast %struct.struct_node* %9 to i8*
  %11 = load i8* %10, align 8
  %12 = and i8 %11, -2
  store i8 %12, i8* %10, align 8
  %13 = load %struct.struct_node** %newNode, align 8
  %14 = bitcast %struct.struct_node* %13 to i8*
  %15 = load i8* %14, align 8
  %16 = and i8 %15, -5
  store i8 %16, i8* %14, align 8
  %17 = load %struct.struct_node** %newNode, align 8
  %18 = getelementptr inbounds %struct.struct_node* %17, i32 0, i32 2
  store %struct.struct_node* null, %struct.struct_node** %18, align 8
  %19 = load %struct.struct_node** %newNode, align 8
  %20 = getelementptr inbounds %struct.struct_node* %19, i32 0, i32 3
  store %struct.struct_node* null, %struct.struct_node** %20, align 8
  %21 = load i32* @counter, align 4
  %22 = load %struct.struct_node** %newNode, align 8
  %23 = getelementptr inbounds %struct.struct_node* %22, i32 0, i32 4
  store i32 %21, i32* %23, align 4
  %24 = load %struct.struct_node** %newNode, align 8
  %25 = bitcast %struct.struct_node* %24 to i8*
  %26 = load i8* %25, align 8
  %27 = and i8 %26, -97
  store i8 %27, i8* %25, align 8
  %28 = load %struct.struct_node** %newNode, align 8
  %29 = bitcast %struct.struct_node* %28 to i8*
  %30 = load i8* %29, align 8
  %31 = and i8 %30, -97
  %32 = or i8 %31, 32
  store i8 %32, i8* %29, align 8
  %33 = load i32* @counter, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* @counter, align 4
  %35 = load %struct.struct_node** %newNode, align 8
  ret %struct.struct_node* %35
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.struct_node* @setLeft(%struct.struct_node* %curr, %struct.struct_node* %left) #0 {
  %1 = alloca %struct.struct_node*, align 8
  %2 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %1, align 8
  store %struct.struct_node* %left, %struct.struct_node** %2, align 8
  %3 = load %struct.struct_node** %1, align 8
  %4 = getelementptr inbounds %struct.struct_node* %3, i32 0, i32 4
  %5 = load i32* %4, align 4
  %6 = load %struct.struct_node** %2, align 8
  %7 = getelementptr inbounds %struct.struct_node* %6, i32 0, i32 4
  %8 = load i32* %7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i32 0, i32 0), i32 %5, i32 %8)
  %10 = load %struct.struct_node** %2, align 8
  %11 = load %struct.struct_node** %1, align 8
  %12 = getelementptr inbounds %struct.struct_node* %11, i32 0, i32 2
  store %struct.struct_node* %10, %struct.struct_node** %12, align 8
  %13 = load %struct.struct_node** %2, align 8
  ret %struct.struct_node* %13
}

; Function Attrs: nounwind uwtable
define %struct.struct_node* @setRight(%struct.struct_node* %curr, %struct.struct_node* %right) #0 {
  %1 = alloca %struct.struct_node*, align 8
  %2 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %curr, %struct.struct_node** %1, align 8
  store %struct.struct_node* %right, %struct.struct_node** %2, align 8
  %3 = load %struct.struct_node** %1, align 8
  %4 = getelementptr inbounds %struct.struct_node* %3, i32 0, i32 4
  %5 = load i32* %4, align 4
  %6 = load %struct.struct_node** %2, align 8
  %7 = getelementptr inbounds %struct.struct_node* %6, i32 0, i32 4
  %8 = load i32* %7, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), i32 %5, i32 %8)
  %10 = load %struct.struct_node** %2, align 8
  %11 = load %struct.struct_node** %1, align 8
  %12 = getelementptr inbounds %struct.struct_node* %11, i32 0, i32 3
  store %struct.struct_node* %10, %struct.struct_node** %12, align 8
  %13 = load %struct.struct_node** %2, align 8
  ret %struct.struct_node* %13
}

; Function Attrs: nounwind uwtable
define void @showGraph(%struct.struct_node* %this) #0 {
  %1 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %1, align 8
  %2 = load %struct.struct_node** %1, align 8
  %3 = icmp eq %struct.struct_node* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %45

; <label>:5                                       ; preds = %0
  %6 = load %struct.struct_node** %1, align 8
  %7 = bitcast %struct.struct_node* %6 to i8*
  %8 = load i8* %7, align 8
  %9 = lshr i8 %8, 2
  %10 = and i8 %9, 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %5
  br label %45

; <label>:14                                      ; preds = %5
  %15 = load %struct.struct_node** %1, align 8
  %16 = getelementptr inbounds %struct.struct_node* %15, i32 0, i32 4
  %17 = load i32* %16, align 4
  %18 = load %struct.struct_node** %1, align 8
  %19 = bitcast %struct.struct_node* %18 to i8*
  %20 = load i8* %19, align 8
  %21 = and i8 %20, 1
  %22 = zext i8 %21 to i32
  %23 = load %struct.struct_node** %1, align 8
  %24 = getelementptr inbounds %struct.struct_node* %23, i32 0, i32 2
  %25 = load %struct.struct_node** %24, align 8
  %26 = getelementptr inbounds %struct.struct_node* %25, i32 0, i32 4
  %27 = load i32* %26, align 4
  %28 = load %struct.struct_node** %1, align 8
  %29 = getelementptr inbounds %struct.struct_node* %28, i32 0, i32 3
  %30 = load %struct.struct_node** %29, align 8
  %31 = getelementptr inbounds %struct.struct_node* %30, i32 0, i32 4
  %32 = load i32* %31, align 4
  %33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str3, i32 0, i32 0), i32 %17, i32 %22, i32 %27, i32 %32)
  %34 = load %struct.struct_node** %1, align 8
  %35 = bitcast %struct.struct_node* %34 to i8*
  %36 = load i8* %35, align 8
  %37 = and i8 %36, -5
  %38 = or i8 %37, 4
  store i8 %38, i8* %35, align 8
  %39 = load %struct.struct_node** %1, align 8
  %40 = getelementptr inbounds %struct.struct_node* %39, i32 0, i32 2
  %41 = load %struct.struct_node** %40, align 8
  call void @showGraph(%struct.struct_node* %41)
  %42 = load %struct.struct_node** %1, align 8
  %43 = getelementptr inbounds %struct.struct_node* %42, i32 0, i32 3
  %44 = load %struct.struct_node** %43, align 8
  call void @showGraph(%struct.struct_node* %44)
  br label %45

; <label>:45                                      ; preds = %14, %13, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @cleanGraph(%struct.struct_node* %this) #0 {
  %1 = alloca %struct.struct_node*, align 8
  store %struct.struct_node* %this, %struct.struct_node** %1, align 8
  %2 = load %struct.struct_node** %1, align 8
  %3 = icmp eq %struct.struct_node* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %32

; <label>:5                                       ; preds = %0
  %6 = load %struct.struct_node** %1, align 8
  %7 = bitcast %struct.struct_node* %6 to i8*
  %8 = load i8* %7, align 8
  %9 = lshr i8 %8, 2
  %10 = and i8 %9, 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %32

; <label>:13                                      ; preds = %5
  %14 = load %struct.struct_node** %1, align 8
  %15 = bitcast %struct.struct_node* %14 to i8*
  %16 = load i8* %15, align 8
  %17 = and i8 %16, -5
  store i8 %17, i8* %15, align 8
  %18 = load %struct.struct_node** %1, align 8
  %19 = bitcast %struct.struct_node* %18 to i8*
  %20 = load i8* %19, align 8
  %21 = and i8 %20, -2
  store i8 %21, i8* %19, align 8
  %22 = load %struct.struct_node** %1, align 8
  %23 = bitcast %struct.struct_node* %22 to i8*
  %24 = load i8* %23, align 8
  %25 = and i8 %24, -3
  store i8 %25, i8* %23, align 8
  %26 = load %struct.struct_node** %1, align 8
  %27 = getelementptr inbounds %struct.struct_node* %26, i32 0, i32 2
  %28 = load %struct.struct_node** %27, align 8
  call void @cleanGraph(%struct.struct_node* %28)
  %29 = load %struct.struct_node** %1, align 8
  %30 = getelementptr inbounds %struct.struct_node* %29, i32 0, i32 3
  %31 = load %struct.struct_node** %30, align 8
  call void @cleanGraph(%struct.struct_node* %31)
  br label %32

; <label>:32                                      ; preds = %4, %13, %5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.struct_node*, align 8
  %b = alloca %struct.struct_node*, align 8
  %c = alloca %struct.struct_node*, align 8
  %d = alloca %struct.struct_node*, align 8
  %e = alloca %struct.struct_node*, align 8
  %root = alloca %struct.struct_node*, align 8
  store i32 0, i32* %1
  %2 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %2, %struct.struct_node** %a, align 8
  %3 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %3, %struct.struct_node** %b, align 8
  %4 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %4, %struct.struct_node** %c, align 8
  %5 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %5, %struct.struct_node** %d, align 8
  %6 = call %struct.struct_node* @createNode()
  store %struct.struct_node* %6, %struct.struct_node** %e, align 8
  %7 = load %struct.struct_node** %a, align 8
  %8 = load %struct.struct_node** %b, align 8
  %9 = call %struct.struct_node* @setLeft(%struct.struct_node* %7, %struct.struct_node* %8)
  %10 = load %struct.struct_node** %a, align 8
  %11 = load %struct.struct_node** %c, align 8
  %12 = call %struct.struct_node* @setRight(%struct.struct_node* %10, %struct.struct_node* %11)
  %13 = load %struct.struct_node** %b, align 8
  %14 = load %struct.struct_node** %d, align 8
  %15 = call %struct.struct_node* @setLeft(%struct.struct_node* %13, %struct.struct_node* %14)
  %16 = load %struct.struct_node** %b, align 8
  %17 = load %struct.struct_node** %d, align 8
  %18 = call %struct.struct_node* @setRight(%struct.struct_node* %16, %struct.struct_node* %17)
  %19 = load %struct.struct_node** %c, align 8
  %20 = load %struct.struct_node** %b, align 8
  %21 = call %struct.struct_node* @setLeft(%struct.struct_node* %19, %struct.struct_node* %20)
  %22 = load %struct.struct_node** %c, align 8
  %23 = load %struct.struct_node** %a, align 8
  %24 = call %struct.struct_node* @setRight(%struct.struct_node* %22, %struct.struct_node* %23)
  %25 = load %struct.struct_node** %d, align 8
  %26 = load %struct.struct_node** %c, align 8
  %27 = call %struct.struct_node* @setLeft(%struct.struct_node* %25, %struct.struct_node* %26)
  %28 = load %struct.struct_node** %d, align 8
  %29 = load %struct.struct_node** %e, align 8
  %30 = call %struct.struct_node* @setRight(%struct.struct_node* %28, %struct.struct_node* %29)
  %31 = load %struct.struct_node** %e, align 8
  %32 = load %struct.struct_node** %e, align 8
  %33 = call %struct.struct_node* @setLeft(%struct.struct_node* %31, %struct.struct_node* %32)
  %34 = load %struct.struct_node** %e, align 8
  %35 = load %struct.struct_node** %a, align 8
  %36 = call %struct.struct_node* @setRight(%struct.struct_node* %34, %struct.struct_node* %35)
  %37 = load %struct.struct_node** %a, align 8
  store %struct.struct_node* %37, %struct.struct_node** %root, align 8
  %38 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %38)
  %39 = load %struct.struct_node** %root, align 8
  call void @cleanGraph(%struct.struct_node* %39)
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i32 0, i32 0))
  %41 = load %struct.struct_node** %root, align 8
  call void @schorr_waite(%struct.struct_node* %41)
  %42 = load %struct.struct_node** %root, align 8
  call void @showGraph(%struct.struct_node* %42)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
