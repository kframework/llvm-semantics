; ModuleID = './20020406-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DUPFFstruct = type { i32, i32, i32* }

@.str = private unnamed_addr constant [40 x i8] c"DUPFFexgcd called on degrees %d and %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [41 x i8] c"calling DUPFFexgcd on degrees %d and %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @FFmul(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @DUPFFdeg(%struct.DUPFFstruct* %f) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %1, align 8
  %2 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %1, align 8
  %3 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %2, i32 0, i32 1
  %4 = load i32, i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define %struct.DUPFFstruct* @DUPFFnew(i32 %maxdeg) #0 {
  %1 = alloca i32, align 4
  %ans = alloca %struct.DUPFFstruct*, align 8
  store i32 %maxdeg, i32* %1, align 4
  %2 = call noalias i8* @malloc(i64 16) #4
  %3 = bitcast i8* %2 to %struct.DUPFFstruct*
  store %struct.DUPFFstruct* %3, %struct.DUPFFstruct** %ans, align 8
  %4 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ans, align 8
  %5 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %4, i32 0, i32 2
  store i32* null, i32** %5, align 8
  %6 = load i32, i32* %1, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %16

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* %1, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = call noalias i8* @calloc(i64 %11, i64 4) #4
  %13 = bitcast i8* %12 to i32*
  %14 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ans, align 8
  %15 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %14, i32 0, i32 2
  store i32* %13, i32** %15, align 8
  br label %16

; <label>:16                                      ; preds = %8, %0
  %17 = load i32, i32* %1, align 4
  %18 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ans, align 8
  %19 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %18, i32 0, i32 0
  store i32 %17, i32* %19, align 4
  %20 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ans, align 8
  %21 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %20, i32 0, i32 1
  store i32 -1, i32* %21, align 4
  %22 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ans, align 8
  ret %struct.DUPFFstruct* %22
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: nounwind uwtable
define void @DUPFFfree(%struct.DUPFFstruct* %x) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @DUPFFswap(%struct.DUPFFstruct* %x, %struct.DUPFFstruct* %y) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  %2 = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %1, align 8
  store %struct.DUPFFstruct* %y, %struct.DUPFFstruct** %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %x) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  store %struct.DUPFFstruct* %x, %struct.DUPFFstruct** %1, align 8
  %2 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %1, align 8
  ret %struct.DUPFFstruct* %2
}

; Function Attrs: nounwind uwtable
define void @DUPFFshift_add(%struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g, i32 %deg, i32 %coeff) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  %2 = alloca %struct.DUPFFstruct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %1, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %2, align 8
  store i32 %deg, i32* %3, align 4
  store i32 %coeff, i32* %4, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g) #0 {
  %1 = alloca %struct.DUPFFstruct*, align 8
  %2 = alloca %struct.DUPFFstruct**, align 8
  %3 = alloca %struct.DUPFFstruct**, align 8
  %4 = alloca %struct.DUPFFstruct*, align 8
  %5 = alloca %struct.DUPFFstruct*, align 8
  %u = alloca %struct.DUPFFstruct*, align 8
  %v = alloca %struct.DUPFFstruct*, align 8
  %uf = alloca %struct.DUPFFstruct*, align 8
  %ug = alloca %struct.DUPFFstruct*, align 8
  %vf = alloca %struct.DUPFFstruct*, align 8
  %vg = alloca %struct.DUPFFstruct*, align 8
  %q = alloca i32, align 4
  %lcu = alloca i32, align 4
  %lcvrecip = alloca i32, align 4
  %p = alloca i32, align 4
  %df = alloca i32, align 4
  %dg = alloca i32, align 4
  %du = alloca i32, align 4
  %dv = alloca i32, align 4
  store %struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct*** %2, align 8
  store %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct*** %3, align 8
  store %struct.DUPFFstruct* %f, %struct.DUPFFstruct** %4, align 8
  store %struct.DUPFFstruct* %g, %struct.DUPFFstruct** %5, align 8
  %6 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %7 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %6)
  %8 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %9 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %8)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str, i32 0, i32 0), i32 %7, i32 %9)
  %11 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %12 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %11)
  %13 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %14 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %13)
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %0
  %17 = load %struct.DUPFFstruct**, %struct.DUPFFstruct*** %3, align 8
  %18 = load %struct.DUPFFstruct**, %struct.DUPFFstruct*** %2, align 8
  %19 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %20 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %21 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %17, %struct.DUPFFstruct** %18, %struct.DUPFFstruct* %19, %struct.DUPFFstruct* %20)
  store %struct.DUPFFstruct* %21, %struct.DUPFFstruct** %1
  br label %161

; <label>:22                                      ; preds = %0
  %23 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %24 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %23)
  %25 = icmp ne i32 %24, 2
  br i1 %25, label %30, label %26

; <label>:26                                      ; preds = %22
  %27 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %28 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %27)
  %29 = icmp ne i32 %28, 1
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26, %22
  call void @abort() #5
  unreachable

; <label>:31                                      ; preds = %26
  %32 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %33 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %32, i32 0, i32 2
  %34 = load i32*, i32** %33, align 8
  %35 = getelementptr inbounds i32, i32* %34, i64 0
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %31
  %39 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  store %struct.DUPFFstruct* %39, %struct.DUPFFstruct** %1
  br label %161

; <label>:40                                      ; preds = %31
  store i32 2, i32* %p, align 4
  %41 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %42 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %41)
  store i32 %42, i32* %df, align 4
  %43 = load i32, i32* %df, align 4
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %40
  store i32 0, i32* %df, align 4
  br label %46

; <label>:46                                      ; preds = %45, %40
  %47 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %48 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %47)
  store i32 %48, i32* %dg, align 4
  %49 = load i32, i32* %dg, align 4
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %46
  store i32 0, i32* %dg, align 4
  br label %52

; <label>:52                                      ; preds = %51, %46
  %53 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %4, align 8
  %54 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %53)
  store %struct.DUPFFstruct* %54, %struct.DUPFFstruct** %u, align 8
  %55 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %5, align 8
  %56 = call %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %55)
  store %struct.DUPFFstruct* %56, %struct.DUPFFstruct** %v, align 8
  %57 = load i32, i32* %dg, align 4
  %58 = call %struct.DUPFFstruct* @DUPFFnew(i32 %57)
  store %struct.DUPFFstruct* %58, %struct.DUPFFstruct** %uf, align 8
  %59 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %60 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %59, i32 0, i32 2
  %61 = load i32*, i32** %60, align 8
  %62 = getelementptr inbounds i32, i32* %61, i64 0
  store i32 1, i32* %62, align 4
  %63 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %64 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %63, i32 0, i32 1
  store i32 0, i32* %64, align 4
  %65 = load i32, i32* %df, align 4
  %66 = call %struct.DUPFFstruct* @DUPFFnew(i32 %65)
  store %struct.DUPFFstruct* %66, %struct.DUPFFstruct** %ug, align 8
  %67 = load i32, i32* %dg, align 4
  %68 = call %struct.DUPFFstruct* @DUPFFnew(i32 %67)
  store %struct.DUPFFstruct* %68, %struct.DUPFFstruct** %vf, align 8
  %69 = load i32, i32* %df, align 4
  %70 = call %struct.DUPFFstruct* @DUPFFnew(i32 %69)
  store %struct.DUPFFstruct* %70, %struct.DUPFFstruct** %vg, align 8
  %71 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  %72 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %71, i32 0, i32 2
  %73 = load i32*, i32** %72, align 8
  %74 = getelementptr inbounds i32, i32* %73, i64 0
  store i32 1, i32* %74, align 4
  %75 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  %76 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %75, i32 0, i32 1
  store i32 0, i32* %76, align 4
  br label %77

; <label>:77                                      ; preds = %134, %52
  %78 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  %79 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %78)
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %81, label %141

; <label>:81                                      ; preds = %77
  %82 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  %83 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %82)
  store i32 %83, i32* %dv, align 4
  %84 = load i32, i32* %dv, align 4
  %85 = sext i32 %84 to i64
  %86 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  %87 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %86, i32 0, i32 2
  %88 = load i32*, i32** %87, align 8
  %89 = getelementptr inbounds i32, i32* %88, i64 %85
  %90 = load i32, i32* %89, align 4
  %91 = call i32 @FFmul(i32 1, i32 %90)
  store i32 %91, i32* %lcvrecip, align 4
  br label %92

; <label>:92                                      ; preds = %97, %81
  %93 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %94 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %93)
  %95 = load i32, i32* %dv, align 4
  %96 = icmp sge i32 %94, %95
  br i1 %96, label %97, label %134

; <label>:97                                      ; preds = %92
  %98 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %99 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %98)
  store i32 %99, i32* %du, align 4
  %100 = load i32, i32* %du, align 4
  %101 = sext i32 %100 to i64
  %102 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %103 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %102, i32 0, i32 2
  %104 = load i32*, i32** %103, align 8
  %105 = getelementptr inbounds i32, i32* %104, i64 %101
  %106 = load i32, i32* %105, align 4
  store i32 %106, i32* %lcu, align 4
  %107 = load i32, i32* %lcu, align 4
  %108 = load i32, i32* %lcvrecip, align 4
  %109 = call i32 @FFmul(i32 %107, i32 %108)
  store i32 %109, i32* %q, align 4
  %110 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %111 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  %112 = load i32, i32* %du, align 4
  %113 = load i32, i32* %dv, align 4
  %114 = sub nsw i32 %112, %113
  %115 = load i32, i32* %p, align 4
  %116 = load i32, i32* %q, align 4
  %117 = sub i32 %115, %116
  call void @DUPFFshift_add(%struct.DUPFFstruct* %110, %struct.DUPFFstruct* %111, i32 %114, i32 %117)
  %118 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %119 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vf, align 8
  %120 = load i32, i32* %du, align 4
  %121 = load i32, i32* %dv, align 4
  %122 = sub nsw i32 %120, %121
  %123 = load i32, i32* %p, align 4
  %124 = load i32, i32* %q, align 4
  %125 = sub i32 %123, %124
  call void @DUPFFshift_add(%struct.DUPFFstruct* %118, %struct.DUPFFstruct* %119, i32 %122, i32 %125)
  %126 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ug, align 8
  %127 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  %128 = load i32, i32* %du, align 4
  %129 = load i32, i32* %dv, align 4
  %130 = sub nsw i32 %128, %129
  %131 = load i32, i32* %p, align 4
  %132 = load i32, i32* %q, align 4
  %133 = sub i32 %131, %132
  call void @DUPFFshift_add(%struct.DUPFFstruct* %126, %struct.DUPFFstruct* %127, i32 %130, i32 %133)
  br label %92

; <label>:134                                     ; preds = %92
  %135 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %136 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %135, %struct.DUPFFstruct* %136)
  %137 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %138 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %137, %struct.DUPFFstruct* %138)
  %139 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ug, align 8
  %140 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %139, %struct.DUPFFstruct* %140)
  br label %77

; <label>:141                                     ; preds = %77
  %142 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  %143 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %142)
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %152

; <label>:145                                     ; preds = %141
  %146 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  %147 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %146, %struct.DUPFFstruct* %147)
  %148 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %149 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %148, %struct.DUPFFstruct* %149)
  %150 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ug, align 8
  %151 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFswap(%struct.DUPFFstruct* %150, %struct.DUPFFstruct* %151)
  br label %152

; <label>:152                                     ; preds = %145, %141
  %153 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vf, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %153)
  %154 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %vg, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %154)
  %155 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %v, align 8
  call void @DUPFFfree(%struct.DUPFFstruct* %155)
  %156 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %uf, align 8
  %157 = load %struct.DUPFFstruct**, %struct.DUPFFstruct*** %2, align 8
  store %struct.DUPFFstruct* %156, %struct.DUPFFstruct** %157, align 8
  %158 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %ug, align 8
  %159 = load %struct.DUPFFstruct**, %struct.DUPFFstruct*** %3, align 8
  store %struct.DUPFFstruct* %158, %struct.DUPFFstruct** %159, align 8
  %160 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %u, align 8
  store %struct.DUPFFstruct* %160, %struct.DUPFFstruct** %1
  br label %161

; <label>:161                                     ; preds = %152, %38, %16
  %162 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %1
  ret %struct.DUPFFstruct* %162
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca %struct.DUPFFstruct*, align 8
  %g = alloca %struct.DUPFFstruct*, align 8
  %cf = alloca %struct.DUPFFstruct*, align 8
  %cg = alloca %struct.DUPFFstruct*, align 8
  %h = alloca %struct.DUPFFstruct*, align 8
  store i32 0, i32* %1
  %2 = call %struct.DUPFFstruct* @DUPFFnew(i32 1)
  store %struct.DUPFFstruct* %2, %struct.DUPFFstruct** %f, align 8
  %3 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %f, align 8
  %4 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %3, i32 0, i32 2
  %5 = load i32*, i32** %4, align 8
  %6 = getelementptr inbounds i32, i32* %5, i64 1
  store i32 1, i32* %6, align 4
  %7 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %f, align 8
  %8 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %7, i32 0, i32 1
  store i32 1, i32* %8, align 4
  %9 = call %struct.DUPFFstruct* @DUPFFnew(i32 2)
  store %struct.DUPFFstruct* %9, %struct.DUPFFstruct** %g, align 8
  %10 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %g, align 8
  %11 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %10, i32 0, i32 2
  %12 = load i32*, i32** %11, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 2
  store i32 1, i32* %13, align 4
  %14 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %g, align 8
  %15 = getelementptr inbounds %struct.DUPFFstruct, %struct.DUPFFstruct* %14, i32 0, i32 1
  store i32 2, i32* %15, align 4
  %16 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %f, align 8
  %17 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %16)
  %18 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %g, align 8
  %19 = call i32 @DUPFFdeg(%struct.DUPFFstruct* %18)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.1, i32 0, i32 0), i32 %17, i32 %19)
  %21 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %f, align 8
  %22 = load %struct.DUPFFstruct*, %struct.DUPFFstruct** %g, align 8
  %23 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %cf, %struct.DUPFFstruct** %cg, %struct.DUPFFstruct* %21, %struct.DUPFFstruct* %22)
  store %struct.DUPFFstruct* %23, %struct.DUPFFstruct** %h, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
