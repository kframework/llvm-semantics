; ModuleID = './hashtable.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hashtbl = type { i64, %struct.hashnode_s**, i64 (i8*)* }
%struct.hashnode_s = type { i8*, i8*, %struct.hashnode_s* }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: hashtbl_create() failed\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"France\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"Paris\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"England\00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"London\00", align 1
@.str5 = private unnamed_addr constant [7 x i8] c"Sweden\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"Stockholm\00", align 1
@.str7 = private unnamed_addr constant [8 x i8] c"Germany\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"Berlin\00", align 1
@.str9 = private unnamed_addr constant [7 x i8] c"Norway\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"Oslo\00", align 1
@.str11 = private unnamed_addr constant [6 x i8] c"Italy\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"Rome\00", align 1
@.str13 = private unnamed_addr constant [6 x i8] c"Spain\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"Madrid\00", align 1
@.str15 = private unnamed_addr constant [8 x i8] c"Estonia\00", align 1
@.str16 = private unnamed_addr constant [8 x i8] c"Tallinn\00", align 1
@.str17 = private unnamed_addr constant [12 x i8] c"Netherlands\00", align 1
@.str18 = private unnamed_addr constant [10 x i8] c"Amsterdam\00", align 1
@.str19 = private unnamed_addr constant [8 x i8] c"Ireland\00", align 1
@.str20 = private unnamed_addr constant [7 x i8] c"Dublin\00", align 1
@.str21 = private unnamed_addr constant [15 x i8] c"After insert:\0A\00", align 1
@.str22 = private unnamed_addr constant [11 x i8] c"Italy: %s\0A\00", align 1
@.str23 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str24 = private unnamed_addr constant [11 x i8] c"Spain: %s\0A\00", align 1
@.str25 = private unnamed_addr constant [15 x i8] c"After remove:\0A\00", align 1
@.str26 = private unnamed_addr constant [15 x i8] c"After resize:\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.hashtbl* @hashtbl_create(i64 %size, i64 (i8*)* %hashfunc) #0 {
  %1 = alloca %struct.hashtbl*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64 (i8*)*, align 8
  %hashtbl = alloca %struct.hashtbl*, align 8
  %i = alloca i32, align 4
  store i64 %size, i64* %2, align 8
  store i64 (i8*)* %hashfunc, i64 (i8*)** %3, align 8
  %4 = call noalias i8* @malloc(i64 24) #5
  %5 = bitcast i8* %4 to %struct.hashtbl*
  store %struct.hashtbl* %5, %struct.hashtbl** %hashtbl, align 8
  %6 = icmp ne %struct.hashtbl* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  store %struct.hashtbl* null, %struct.hashtbl** %1
  br label %49

; <label>:8                                       ; preds = %0
  %9 = load i64* %2, align 8
  %10 = call noalias i8* @calloc(i64 %9, i64 8) #5
  %11 = bitcast i8* %10 to %struct.hashnode_s**
  %12 = load %struct.hashtbl** %hashtbl, align 8
  %13 = getelementptr inbounds %struct.hashtbl* %12, i32 0, i32 1
  store %struct.hashnode_s** %11, %struct.hashnode_s*** %13, align 8
  %14 = icmp ne %struct.hashnode_s** %11, null
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %8
  %16 = load %struct.hashtbl** %hashtbl, align 8
  %17 = bitcast %struct.hashtbl* %16 to i8*
  call void @free(i8* %17) #5
  store %struct.hashtbl* null, %struct.hashtbl** %1
  br label %49

; <label>:18                                      ; preds = %8
  store i32 0, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %31, %18
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i64* %2, align 8
  %23 = icmp ult i64 %21, %22
  br i1 %23, label %24, label %34

; <label>:24                                      ; preds = %19
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct.hashtbl** %hashtbl, align 8
  %28 = getelementptr inbounds %struct.hashtbl* %27, i32 0, i32 1
  %29 = load %struct.hashnode_s*** %28, align 8
  %30 = getelementptr inbounds %struct.hashnode_s** %29, i64 %26
  store %struct.hashnode_s* null, %struct.hashnode_s** %30, align 8
  br label %31

; <label>:31                                      ; preds = %24
  %32 = load i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %19

; <label>:34                                      ; preds = %19
  %35 = load i64* %2, align 8
  %36 = load %struct.hashtbl** %hashtbl, align 8
  %37 = getelementptr inbounds %struct.hashtbl* %36, i32 0, i32 0
  store i64 %35, i64* %37, align 8
  %38 = load i64 (i8*)** %3, align 8
  %39 = icmp ne i64 (i8*)* %38, null
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %34
  %41 = load i64 (i8*)** %3, align 8
  %42 = load %struct.hashtbl** %hashtbl, align 8
  %43 = getelementptr inbounds %struct.hashtbl* %42, i32 0, i32 2
  store i64 (i8*)* %41, i64 (i8*)** %43, align 8
  br label %47

; <label>:44                                      ; preds = %34
  %45 = load %struct.hashtbl** %hashtbl, align 8
  %46 = getelementptr inbounds %struct.hashtbl* %45, i32 0, i32 2
  store i64 (i8*)* @def_hashfunc, i64 (i8*)** %46, align 8
  br label %47

; <label>:47                                      ; preds = %44, %40
  %48 = load %struct.hashtbl** %hashtbl, align 8
  store %struct.hashtbl* %48, %struct.hashtbl** %1
  br label %49

; <label>:49                                      ; preds = %47, %15, %7
  %50 = load %struct.hashtbl** %1
  ret %struct.hashtbl* %50
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define internal i64 @def_hashfunc(i8* %key) #0 {
  %1 = alloca i8*, align 8
  %hash = alloca i64, align 8
  store i8* %key, i8** %1, align 8
  store i64 0, i64* %hash, align 8
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i8** %1, align 8
  %4 = load i8* %3, align 1
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %2
  %7 = load i8** %1, align 8
  %8 = getelementptr inbounds i8* %7, i32 1
  store i8* %8, i8** %1, align 8
  %9 = load i8* %7, align 1
  %10 = zext i8 %9 to i64
  %11 = load i64* %hash, align 8
  %12 = add i64 %11, %10
  store i64 %12, i64* %hash, align 8
  br label %2

; <label>:13                                      ; preds = %2
  %14 = load i64* %hash, align 8
  ret i64 %14
}

; Function Attrs: nounwind uwtable
define void @hashtbl_destroy(%struct.hashtbl* %hashtbl) #0 {
  %1 = alloca %struct.hashtbl*, align 8
  %n = alloca i64, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %oldnode = alloca %struct.hashnode_s*, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %1, align 8
  store i64 0, i64* %n, align 8
  br label %2

; <label>:2                                       ; preds = %29, %0
  %3 = load i64* %n, align 8
  %4 = load %struct.hashtbl** %1, align 8
  %5 = getelementptr inbounds %struct.hashtbl* %4, i32 0, i32 0
  %6 = load i64* %5, align 8
  %7 = icmp ult i64 %3, %6
  br i1 %7, label %8, label %32

; <label>:8                                       ; preds = %2
  %9 = load i64* %n, align 8
  %10 = load %struct.hashtbl** %1, align 8
  %11 = getelementptr inbounds %struct.hashtbl* %10, i32 0, i32 1
  %12 = load %struct.hashnode_s*** %11, align 8
  %13 = getelementptr inbounds %struct.hashnode_s** %12, i64 %9
  %14 = load %struct.hashnode_s** %13, align 8
  store %struct.hashnode_s* %14, %struct.hashnode_s** %node, align 8
  br label %15

; <label>:15                                      ; preds = %18, %8
  %16 = load %struct.hashnode_s** %node, align 8
  %17 = icmp ne %struct.hashnode_s* %16, null
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %15
  %19 = load %struct.hashnode_s** %node, align 8
  %20 = getelementptr inbounds %struct.hashnode_s* %19, i32 0, i32 0
  %21 = load i8** %20, align 8
  call void @free(i8* %21) #5
  %22 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %22, %struct.hashnode_s** %oldnode, align 8
  %23 = load %struct.hashnode_s** %node, align 8
  %24 = getelementptr inbounds %struct.hashnode_s* %23, i32 0, i32 2
  %25 = load %struct.hashnode_s** %24, align 8
  store %struct.hashnode_s* %25, %struct.hashnode_s** %node, align 8
  %26 = load %struct.hashnode_s** %oldnode, align 8
  %27 = bitcast %struct.hashnode_s* %26 to i8*
  call void @free(i8* %27) #5
  br label %15

; <label>:28                                      ; preds = %15
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i64* %n, align 8
  %31 = add i64 %30, 1
  store i64 %31, i64* %n, align 8
  br label %2

; <label>:32                                      ; preds = %2
  %33 = load %struct.hashtbl** %1, align 8
  %34 = getelementptr inbounds %struct.hashtbl* %33, i32 0, i32 1
  %35 = load %struct.hashnode_s*** %34, align 8
  %36 = bitcast %struct.hashnode_s** %35 to i8*
  call void @free(i8* %36) #5
  %37 = load %struct.hashtbl** %1, align 8
  %38 = bitcast %struct.hashtbl* %37 to i8*
  call void @free(i8* %38) #5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @hashtbl_insert(%struct.hashtbl* %hashtbl, i8* %key, i8* %data) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.hashtbl*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %2, align 8
  store i8* %key, i8** %3, align 8
  store i8* %data, i8** %4, align 8
  %5 = load %struct.hashtbl** %2, align 8
  %6 = getelementptr inbounds %struct.hashtbl* %5, i32 0, i32 2
  %7 = load i64 (i8*)** %6, align 8
  %8 = load i8** %3, align 8
  %9 = call i64 %7(i8* %8)
  %10 = load %struct.hashtbl** %2, align 8
  %11 = getelementptr inbounds %struct.hashtbl* %10, i32 0, i32 0
  %12 = load i64* %11, align 8
  %13 = urem i64 %9, %12
  store i64 %13, i64* %hash, align 8
  %14 = load i64* %hash, align 8
  %15 = load %struct.hashtbl** %2, align 8
  %16 = getelementptr inbounds %struct.hashtbl* %15, i32 0, i32 1
  %17 = load %struct.hashnode_s*** %16, align 8
  %18 = getelementptr inbounds %struct.hashnode_s** %17, i64 %14
  %19 = load %struct.hashnode_s** %18, align 8
  store %struct.hashnode_s* %19, %struct.hashnode_s** %node, align 8
  br label %20

; <label>:20                                      ; preds = %34, %0
  %21 = load %struct.hashnode_s** %node, align 8
  %22 = icmp ne %struct.hashnode_s* %21, null
  br i1 %22, label %23, label %38

; <label>:23                                      ; preds = %20
  %24 = load %struct.hashnode_s** %node, align 8
  %25 = getelementptr inbounds %struct.hashnode_s* %24, i32 0, i32 0
  %26 = load i8** %25, align 8
  %27 = load i8** %3, align 8
  %28 = call i32 @strcmp(i8* %26, i8* %27) #6
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %34, label %30

; <label>:30                                      ; preds = %23
  %31 = load i8** %4, align 8
  %32 = load %struct.hashnode_s** %node, align 8
  %33 = getelementptr inbounds %struct.hashnode_s* %32, i32 0, i32 1
  store i8* %31, i8** %33, align 8
  store i32 0, i32* %1
  br label %70

; <label>:34                                      ; preds = %23
  %35 = load %struct.hashnode_s** %node, align 8
  %36 = getelementptr inbounds %struct.hashnode_s* %35, i32 0, i32 2
  %37 = load %struct.hashnode_s** %36, align 8
  store %struct.hashnode_s* %37, %struct.hashnode_s** %node, align 8
  br label %20

; <label>:38                                      ; preds = %20
  %39 = call noalias i8* @malloc(i64 24) #5
  %40 = bitcast i8* %39 to %struct.hashnode_s*
  store %struct.hashnode_s* %40, %struct.hashnode_s** %node, align 8
  %41 = icmp ne %struct.hashnode_s* %40, null
  br i1 %41, label %43, label %42

; <label>:42                                      ; preds = %38
  store i32 -1, i32* %1
  br label %70

; <label>:43                                      ; preds = %38
  %44 = load i8** %3, align 8
  %45 = call i8* @mystrdup(i8* %44)
  %46 = load %struct.hashnode_s** %node, align 8
  %47 = getelementptr inbounds %struct.hashnode_s* %46, i32 0, i32 0
  store i8* %45, i8** %47, align 8
  %48 = icmp ne i8* %45, null
  br i1 %48, label %52, label %49

; <label>:49                                      ; preds = %43
  %50 = load %struct.hashnode_s** %node, align 8
  %51 = bitcast %struct.hashnode_s* %50 to i8*
  call void @free(i8* %51) #5
  store i32 -1, i32* %1
  br label %70

; <label>:52                                      ; preds = %43
  %53 = load i8** %4, align 8
  %54 = load %struct.hashnode_s** %node, align 8
  %55 = getelementptr inbounds %struct.hashnode_s* %54, i32 0, i32 1
  store i8* %53, i8** %55, align 8
  %56 = load i64* %hash, align 8
  %57 = load %struct.hashtbl** %2, align 8
  %58 = getelementptr inbounds %struct.hashtbl* %57, i32 0, i32 1
  %59 = load %struct.hashnode_s*** %58, align 8
  %60 = getelementptr inbounds %struct.hashnode_s** %59, i64 %56
  %61 = load %struct.hashnode_s** %60, align 8
  %62 = load %struct.hashnode_s** %node, align 8
  %63 = getelementptr inbounds %struct.hashnode_s* %62, i32 0, i32 2
  store %struct.hashnode_s* %61, %struct.hashnode_s** %63, align 8
  %64 = load %struct.hashnode_s** %node, align 8
  %65 = load i64* %hash, align 8
  %66 = load %struct.hashtbl** %2, align 8
  %67 = getelementptr inbounds %struct.hashtbl* %66, i32 0, i32 1
  %68 = load %struct.hashnode_s*** %67, align 8
  %69 = getelementptr inbounds %struct.hashnode_s** %68, i64 %65
  store %struct.hashnode_s* %64, %struct.hashnode_s** %69, align 8
  store i32 0, i32* %1
  br label %70

; <label>:70                                      ; preds = %52, %49, %42, %30
  %71 = load i32* %1
  ret i32 %71
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define internal i8* @mystrdup(i8* %s) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %b = alloca i8*, align 8
  store i8* %s, i8** %2, align 8
  %3 = load i8** %2, align 8
  %4 = call i64 @strlen(i8* %3) #6
  %5 = add i64 %4, 1
  %6 = call noalias i8* @malloc(i64 %5) #5
  store i8* %6, i8** %b, align 8
  %7 = icmp ne i8* %6, null
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %0
  store i8* null, i8** %1
  br label %14

; <label>:9                                       ; preds = %0
  %10 = load i8** %b, align 8
  %11 = load i8** %2, align 8
  %12 = call i8* @strcpy(i8* %10, i8* %11) #5
  %13 = load i8** %b, align 8
  store i8* %13, i8** %1
  br label %14

; <label>:14                                      ; preds = %9, %8
  %15 = load i8** %1
  ret i8* %15
}

; Function Attrs: nounwind uwtable
define i32 @hashtbl_remove(%struct.hashtbl* %hashtbl, i8* %key) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.hashtbl*, align 8
  %3 = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %prevnode = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %2, align 8
  store i8* %key, i8** %3, align 8
  store %struct.hashnode_s* null, %struct.hashnode_s** %prevnode, align 8
  %4 = load %struct.hashtbl** %2, align 8
  %5 = getelementptr inbounds %struct.hashtbl* %4, i32 0, i32 2
  %6 = load i64 (i8*)** %5, align 8
  %7 = load i8** %3, align 8
  %8 = call i64 %6(i8* %7)
  %9 = load %struct.hashtbl** %2, align 8
  %10 = getelementptr inbounds %struct.hashtbl* %9, i32 0, i32 0
  %11 = load i64* %10, align 8
  %12 = urem i64 %8, %11
  store i64 %12, i64* %hash, align 8
  %13 = load i64* %hash, align 8
  %14 = load %struct.hashtbl** %2, align 8
  %15 = getelementptr inbounds %struct.hashtbl* %14, i32 0, i32 1
  %16 = load %struct.hashnode_s*** %15, align 8
  %17 = getelementptr inbounds %struct.hashnode_s** %16, i64 %13
  %18 = load %struct.hashnode_s** %17, align 8
  store %struct.hashnode_s* %18, %struct.hashnode_s** %node, align 8
  br label %19

; <label>:19                                      ; preds = %53, %0
  %20 = load %struct.hashnode_s** %node, align 8
  %21 = icmp ne %struct.hashnode_s* %20, null
  br i1 %21, label %22, label %58

; <label>:22                                      ; preds = %19
  %23 = load %struct.hashnode_s** %node, align 8
  %24 = getelementptr inbounds %struct.hashnode_s* %23, i32 0, i32 0
  %25 = load i8** %24, align 8
  %26 = load i8** %3, align 8
  %27 = call i32 @strcmp(i8* %25, i8* %26) #6
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %53, label %29

; <label>:29                                      ; preds = %22
  %30 = load %struct.hashnode_s** %node, align 8
  %31 = getelementptr inbounds %struct.hashnode_s* %30, i32 0, i32 0
  %32 = load i8** %31, align 8
  call void @free(i8* %32) #5
  %33 = load %struct.hashnode_s** %prevnode, align 8
  %34 = icmp ne %struct.hashnode_s* %33, null
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %29
  %36 = load %struct.hashnode_s** %node, align 8
  %37 = getelementptr inbounds %struct.hashnode_s* %36, i32 0, i32 2
  %38 = load %struct.hashnode_s** %37, align 8
  %39 = load %struct.hashnode_s** %prevnode, align 8
  %40 = getelementptr inbounds %struct.hashnode_s* %39, i32 0, i32 2
  store %struct.hashnode_s* %38, %struct.hashnode_s** %40, align 8
  br label %50

; <label>:41                                      ; preds = %29
  %42 = load %struct.hashnode_s** %node, align 8
  %43 = getelementptr inbounds %struct.hashnode_s* %42, i32 0, i32 2
  %44 = load %struct.hashnode_s** %43, align 8
  %45 = load i64* %hash, align 8
  %46 = load %struct.hashtbl** %2, align 8
  %47 = getelementptr inbounds %struct.hashtbl* %46, i32 0, i32 1
  %48 = load %struct.hashnode_s*** %47, align 8
  %49 = getelementptr inbounds %struct.hashnode_s** %48, i64 %45
  store %struct.hashnode_s* %44, %struct.hashnode_s** %49, align 8
  br label %50

; <label>:50                                      ; preds = %41, %35
  %51 = load %struct.hashnode_s** %node, align 8
  %52 = bitcast %struct.hashnode_s* %51 to i8*
  call void @free(i8* %52) #5
  store i32 0, i32* %1
  br label %59

; <label>:53                                      ; preds = %22
  %54 = load %struct.hashnode_s** %node, align 8
  store %struct.hashnode_s* %54, %struct.hashnode_s** %prevnode, align 8
  %55 = load %struct.hashnode_s** %node, align 8
  %56 = getelementptr inbounds %struct.hashnode_s* %55, i32 0, i32 2
  %57 = load %struct.hashnode_s** %56, align 8
  store %struct.hashnode_s* %57, %struct.hashnode_s** %node, align 8
  br label %19

; <label>:58                                      ; preds = %19
  store i32 -1, i32* %1
  br label %59

; <label>:59                                      ; preds = %58, %50
  %60 = load i32* %1
  ret i32 %60
}

; Function Attrs: nounwind uwtable
define i8* @hashtbl_get(%struct.hashtbl* %hashtbl, i8* %key) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.hashtbl*, align 8
  %3 = alloca i8*, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %hash = alloca i64, align 8
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %2, align 8
  store i8* %key, i8** %3, align 8
  %4 = load %struct.hashtbl** %2, align 8
  %5 = getelementptr inbounds %struct.hashtbl* %4, i32 0, i32 2
  %6 = load i64 (i8*)** %5, align 8
  %7 = load i8** %3, align 8
  %8 = call i64 %6(i8* %7)
  %9 = load %struct.hashtbl** %2, align 8
  %10 = getelementptr inbounds %struct.hashtbl* %9, i32 0, i32 0
  %11 = load i64* %10, align 8
  %12 = urem i64 %8, %11
  store i64 %12, i64* %hash, align 8
  %13 = load i64* %hash, align 8
  %14 = load %struct.hashtbl** %2, align 8
  %15 = getelementptr inbounds %struct.hashtbl* %14, i32 0, i32 1
  %16 = load %struct.hashnode_s*** %15, align 8
  %17 = getelementptr inbounds %struct.hashnode_s** %16, i64 %13
  %18 = load %struct.hashnode_s** %17, align 8
  store %struct.hashnode_s* %18, %struct.hashnode_s** %node, align 8
  br label %19

; <label>:19                                      ; preds = %33, %0
  %20 = load %struct.hashnode_s** %node, align 8
  %21 = icmp ne %struct.hashnode_s* %20, null
  br i1 %21, label %22, label %37

; <label>:22                                      ; preds = %19
  %23 = load %struct.hashnode_s** %node, align 8
  %24 = getelementptr inbounds %struct.hashnode_s* %23, i32 0, i32 0
  %25 = load i8** %24, align 8
  %26 = load i8** %3, align 8
  %27 = call i32 @strcmp(i8* %25, i8* %26) #6
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %33, label %29

; <label>:29                                      ; preds = %22
  %30 = load %struct.hashnode_s** %node, align 8
  %31 = getelementptr inbounds %struct.hashnode_s* %30, i32 0, i32 1
  %32 = load i8** %31, align 8
  store i8* %32, i8** %1
  br label %38

; <label>:33                                      ; preds = %22
  %34 = load %struct.hashnode_s** %node, align 8
  %35 = getelementptr inbounds %struct.hashnode_s* %34, i32 0, i32 2
  %36 = load %struct.hashnode_s** %35, align 8
  store %struct.hashnode_s* %36, %struct.hashnode_s** %node, align 8
  br label %19

; <label>:37                                      ; preds = %19
  store i8* null, i8** %1
  br label %38

; <label>:38                                      ; preds = %37, %29
  %39 = load i8** %1
  ret i8* %39
}

; Function Attrs: nounwind uwtable
define i32 @hashtbl_resize(%struct.hashtbl* %hashtbl, i64 %size) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.hashtbl*, align 8
  %3 = alloca i64, align 8
  %newtbl = alloca %struct.hashtbl, align 8
  %n = alloca i64, align 8
  %node = alloca %struct.hashnode_s*, align 8
  %next = alloca %struct.hashnode_s*, align 8
  %i = alloca i32, align 4
  store %struct.hashtbl* %hashtbl, %struct.hashtbl** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  store i64 %4, i64* %5, align 8
  %6 = load %struct.hashtbl** %2, align 8
  %7 = getelementptr inbounds %struct.hashtbl* %6, i32 0, i32 2
  %8 = load i64 (i8*)** %7, align 8
  %9 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 2
  store i64 (i8*)* %8, i64 (i8*)** %9, align 8
  %10 = load i64* %3, align 8
  %11 = call noalias i8* @calloc(i64 %10, i64 8) #5
  %12 = bitcast i8* %11 to %struct.hashnode_s**
  %13 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  store %struct.hashnode_s** %12, %struct.hashnode_s*** %13, align 8
  %14 = icmp ne %struct.hashnode_s** %12, null
  br i1 %14, label %16, label %15

; <label>:15                                      ; preds = %0
  store i32 -1, i32* %1
  br label %83

; <label>:16                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %28, %16
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load i64* %3, align 8
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %17
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %26 = load %struct.hashnode_s*** %25, align 8
  %27 = getelementptr inbounds %struct.hashnode_s** %26, i64 %24
  store %struct.hashnode_s* null, %struct.hashnode_s** %27, align 8
  br label %28

; <label>:28                                      ; preds = %22
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %17

; <label>:31                                      ; preds = %17
  store i64 0, i64* %n, align 8
  br label %32

; <label>:32                                      ; preds = %67, %31
  %33 = load i64* %n, align 8
  %34 = load %struct.hashtbl** %2, align 8
  %35 = getelementptr inbounds %struct.hashtbl* %34, i32 0, i32 0
  %36 = load i64* %35, align 8
  %37 = icmp ult i64 %33, %36
  br i1 %37, label %38, label %70

; <label>:38                                      ; preds = %32
  %39 = load i64* %n, align 8
  %40 = load %struct.hashtbl** %2, align 8
  %41 = getelementptr inbounds %struct.hashtbl* %40, i32 0, i32 1
  %42 = load %struct.hashnode_s*** %41, align 8
  %43 = getelementptr inbounds %struct.hashnode_s** %42, i64 %39
  %44 = load %struct.hashnode_s** %43, align 8
  store %struct.hashnode_s* %44, %struct.hashnode_s** %node, align 8
  br label %45

; <label>:45                                      ; preds = %64, %38
  %46 = load %struct.hashnode_s** %node, align 8
  %47 = icmp ne %struct.hashnode_s* %46, null
  br i1 %47, label %48, label %66

; <label>:48                                      ; preds = %45
  %49 = load %struct.hashnode_s** %node, align 8
  %50 = getelementptr inbounds %struct.hashnode_s* %49, i32 0, i32 2
  %51 = load %struct.hashnode_s** %50, align 8
  store %struct.hashnode_s* %51, %struct.hashnode_s** %next, align 8
  %52 = load %struct.hashnode_s** %node, align 8
  %53 = getelementptr inbounds %struct.hashnode_s* %52, i32 0, i32 0
  %54 = load i8** %53, align 8
  %55 = load %struct.hashnode_s** %node, align 8
  %56 = getelementptr inbounds %struct.hashnode_s* %55, i32 0, i32 1
  %57 = load i8** %56, align 8
  %58 = call i32 @hashtbl_insert(%struct.hashtbl* %newtbl, i8* %54, i8* %57)
  %59 = load %struct.hashtbl** %2, align 8
  %60 = load %struct.hashnode_s** %node, align 8
  %61 = getelementptr inbounds %struct.hashnode_s* %60, i32 0, i32 0
  %62 = load i8** %61, align 8
  %63 = call i32 @hashtbl_remove(%struct.hashtbl* %59, i8* %62)
  br label %64

; <label>:64                                      ; preds = %48
  %65 = load %struct.hashnode_s** %next, align 8
  store %struct.hashnode_s* %65, %struct.hashnode_s** %node, align 8
  br label %45

; <label>:66                                      ; preds = %45
  br label %67

; <label>:67                                      ; preds = %66
  %68 = load i64* %n, align 8
  %69 = add i64 %68, 1
  store i64 %69, i64* %n, align 8
  br label %32

; <label>:70                                      ; preds = %32
  %71 = load %struct.hashtbl** %2, align 8
  %72 = getelementptr inbounds %struct.hashtbl* %71, i32 0, i32 1
  %73 = load %struct.hashnode_s*** %72, align 8
  %74 = bitcast %struct.hashnode_s** %73 to i8*
  call void @free(i8* %74) #5
  %75 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 0
  %76 = load i64* %75, align 8
  %77 = load %struct.hashtbl** %2, align 8
  %78 = getelementptr inbounds %struct.hashtbl* %77, i32 0, i32 0
  store i64 %76, i64* %78, align 8
  %79 = getelementptr inbounds %struct.hashtbl* %newtbl, i32 0, i32 1
  %80 = load %struct.hashnode_s*** %79, align 8
  %81 = load %struct.hashtbl** %2, align 8
  %82 = getelementptr inbounds %struct.hashtbl* %81, i32 0, i32 1
  store %struct.hashnode_s** %80, %struct.hashnode_s*** %82, align 8
  store i32 0, i32* %1
  br label %83

; <label>:83                                      ; preds = %70, %15
  %84 = load i32* %1
  ret i32 %84
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %hashtbl = alloca %struct.hashtbl*, align 8
  %spain = alloca i8*, align 8
  %italy = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = call %struct.hashtbl* @hashtbl_create(i64 16, i64 (i8*)* null)
  store %struct.hashtbl* %2, %struct.hashtbl** %hashtbl, align 8
  %3 = icmp ne %struct.hashtbl* %2, null
  br i1 %3, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #7
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load %struct.hashtbl** %hashtbl, align 8
  %8 = call i32 @hashtbl_insert(%struct.hashtbl* %7, i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  %9 = load %struct.hashtbl** %hashtbl, align 8
  %10 = call i32 @hashtbl_insert(%struct.hashtbl* %9, i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str4, i32 0, i32 0))
  %11 = load %struct.hashtbl** %hashtbl, align 8
  %12 = call i32 @hashtbl_insert(%struct.hashtbl* %11, i8* getelementptr inbounds ([7 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0))
  %13 = load %struct.hashtbl** %hashtbl, align 8
  %14 = call i32 @hashtbl_insert(%struct.hashtbl* %13, i8* getelementptr inbounds ([8 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0))
  %15 = load %struct.hashtbl** %hashtbl, align 8
  %16 = call i32 @hashtbl_insert(%struct.hashtbl* %15, i8* getelementptr inbounds ([7 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %17 = load %struct.hashtbl** %hashtbl, align 8
  %18 = call i32 @hashtbl_insert(%struct.hashtbl* %17, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0))
  %19 = load %struct.hashtbl** %hashtbl, align 8
  %20 = call i32 @hashtbl_insert(%struct.hashtbl* %19, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %21 = load %struct.hashtbl** %hashtbl, align 8
  %22 = call i32 @hashtbl_insert(%struct.hashtbl* %21, i8* getelementptr inbounds ([8 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str16, i32 0, i32 0))
  %23 = load %struct.hashtbl** %hashtbl, align 8
  %24 = call i32 @hashtbl_insert(%struct.hashtbl* %23, i8* getelementptr inbounds ([12 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str18, i32 0, i32 0))
  %25 = load %struct.hashtbl** %hashtbl, align 8
  %26 = call i32 @hashtbl_insert(%struct.hashtbl* %25, i8* getelementptr inbounds ([8 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str20, i32 0, i32 0))
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str21, i32 0, i32 0))
  %28 = load %struct.hashtbl** %hashtbl, align 8
  %29 = call i8* @hashtbl_get(%struct.hashtbl* %28, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %29, i8** %italy, align 8
  %30 = load i8** %italy, align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %6
  %33 = load i8** %italy, align 8
  br label %35

; <label>:34                                      ; preds = %6
  br label %35

; <label>:35                                      ; preds = %34, %32
  %36 = phi i8* [ %33, %32 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %34 ]
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %36)
  %38 = load %struct.hashtbl** %hashtbl, align 8
  %39 = call i8* @hashtbl_get(%struct.hashtbl* %38, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %39, i8** %spain, align 8
  %40 = load i8** %spain, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %35
  %43 = load i8** %spain, align 8
  br label %45

; <label>:44                                      ; preds = %35
  br label %45

; <label>:45                                      ; preds = %44, %42
  %46 = phi i8* [ %43, %42 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %44 ]
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %46)
  %48 = load %struct.hashtbl** %hashtbl, align 8
  %49 = call i32 @hashtbl_remove(%struct.hashtbl* %48, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str25, i32 0, i32 0))
  %51 = load %struct.hashtbl** %hashtbl, align 8
  %52 = call i8* @hashtbl_get(%struct.hashtbl* %51, i8* getelementptr inbounds ([6 x i8]* @.str13, i32 0, i32 0))
  store i8* %52, i8** %spain, align 8
  %53 = load i8** %spain, align 8
  %54 = icmp ne i8* %53, null
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %45
  %56 = load i8** %spain, align 8
  br label %58

; <label>:57                                      ; preds = %45
  br label %58

; <label>:58                                      ; preds = %57, %55
  %59 = phi i8* [ %56, %55 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %57 ]
  %60 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* %59)
  %61 = load %struct.hashtbl** %hashtbl, align 8
  %62 = call i32 @hashtbl_resize(%struct.hashtbl* %61, i64 8)
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str26, i32 0, i32 0))
  %64 = load %struct.hashtbl** %hashtbl, align 8
  %65 = call i8* @hashtbl_get(%struct.hashtbl* %64, i8* getelementptr inbounds ([6 x i8]* @.str11, i32 0, i32 0))
  store i8* %65, i8** %italy, align 8
  %66 = load i8** %italy, align 8
  %67 = icmp ne i8* %66, null
  br i1 %67, label %68, label %70

; <label>:68                                      ; preds = %58
  %69 = load i8** %italy, align 8
  br label %71

; <label>:70                                      ; preds = %58
  br label %71

; <label>:71                                      ; preds = %70, %68
  %72 = phi i8* [ %69, %68 ], [ getelementptr inbounds ([2 x i8]* @.str23, i32 0, i32 0), %70 ]
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str22, i32 0, i32 0), i8* %72)
  %74 = load %struct.hashtbl** %hashtbl, align 8
  call void @hashtbl_destroy(%struct.hashtbl* %74)
  ret i32 0
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
