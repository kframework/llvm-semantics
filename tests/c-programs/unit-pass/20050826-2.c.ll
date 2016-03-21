; ModuleID = './20050826-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rtattr = type { i16, i16 }

; Function Attrs: noinline nounwind uwtable
define i32 @inet_check_attr(i8* %r, %struct.rtattr** %rta) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca %struct.rtattr**, align 8
  %i = alloca i32, align 4
  %attr = alloca %struct.rtattr*, align 8
  store i8* %r, i8** %2, align 8
  store %struct.rtattr** %rta, %struct.rtattr*** %3, align 8
  store i32 1, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %40, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp sle i32 %5, 14
  br i1 %6, label %7, label %43

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = sub nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = load %struct.rtattr**, %struct.rtattr*** %3, align 8
  %12 = getelementptr inbounds %struct.rtattr*, %struct.rtattr** %11, i64 %10
  %13 = load %struct.rtattr*, %struct.rtattr** %12, align 8
  store %struct.rtattr* %13, %struct.rtattr** %attr, align 8
  %14 = load %struct.rtattr*, %struct.rtattr** %attr, align 8
  %15 = icmp ne %struct.rtattr* %14, null
  br i1 %15, label %16, label %39

; <label>:16                                      ; preds = %7
  %17 = load %struct.rtattr*, %struct.rtattr** %attr, align 8
  %18 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %17, i32 0, i32 0
  %19 = load i16, i16* %18, align 2
  %20 = zext i16 %19 to i64
  %21 = sub i64 %20, 4
  %22 = icmp ult i64 %21, 4
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  store i32 -22, i32* %1
  br label %44

; <label>:24                                      ; preds = %16
  %25 = load i32, i32* %i, align 4
  %26 = icmp ne i32 %25, 9
  br i1 %26, label %27, label %38

; <label>:27                                      ; preds = %24
  %28 = load i32, i32* %i, align 4
  %29 = icmp ne i32 %28, 8
  br i1 %29, label %30, label %38

; <label>:30                                      ; preds = %27
  %31 = load %struct.rtattr*, %struct.rtattr** %attr, align 8
  %32 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %31, i64 1
  %33 = load i32, i32* %i, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = load %struct.rtattr**, %struct.rtattr*** %3, align 8
  %37 = getelementptr inbounds %struct.rtattr*, %struct.rtattr** %36, i64 %35
  store %struct.rtattr* %32, %struct.rtattr** %37, align 8
  br label %38

; <label>:38                                      ; preds = %30, %27, %24
  br label %39

; <label>:39                                      ; preds = %38, %7
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32, i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %4

; <label>:43                                      ; preds = %4
  store i32 0, i32* %1
  br label %44

; <label>:44                                      ; preds = %43, %23
  %45 = load i32, i32* %1
  ret i32 %45
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %rt = alloca [2 x %struct.rtattr], align 2
  %rta = alloca [14 x %struct.rtattr*], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %3 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %2, i32 0, i32 0
  store i16 12, i16* %3, align 2
  %4 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %5 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %4, i32 0, i32 1
  store i16 0, i16* %5, align 2
  %6 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %7 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %8 = bitcast %struct.rtattr* %6 to i8*
  %9 = bitcast %struct.rtattr* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 4, i32 2, i1 false)
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %18, %0
  %11 = load i32, i32* %i, align 4
  %12 = icmp slt i32 %11, 14
  br i1 %12, label %13, label %21

; <label>:13                                      ; preds = %10
  %14 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %16
  store %struct.rtattr* %14, %struct.rtattr** %17, align 8
  br label %18

; <label>:18                                      ; preds = %13
  %19 = load i32, i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %10

; <label>:21                                      ; preds = %10
  %22 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %23 = call i32 @inet_check_attr(i8* null, %struct.rtattr** %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21
  call void @abort() #4
  unreachable

; <label>:26                                      ; preds = %21
  store i32 0, i32* %i, align 4
  br label %27

; <label>:27                                      ; preds = %48, %26
  %28 = load i32, i32* %i, align 4
  %29 = icmp slt i32 %28, 14
  br i1 %29, label %30, label %51

; <label>:30                                      ; preds = %27
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %32
  %34 = load %struct.rtattr*, %struct.rtattr** %33, align 8
  %35 = load i32, i32* %i, align 4
  %36 = icmp ne i32 %35, 7
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %30
  %38 = load i32, i32* %i, align 4
  %39 = icmp ne i32 %38, 8
  br label %40

; <label>:40                                      ; preds = %37, %30
  %41 = phi i1 [ false, %30 ], [ %39, %37 ]
  %42 = zext i1 %41 to i32
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 %43
  %45 = icmp ne %struct.rtattr* %34, %44
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %40
  call void @abort() #4
  unreachable

; <label>:47                                      ; preds = %40
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32, i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %27

; <label>:51                                      ; preds = %27
  store i32 0, i32* %i, align 4
  br label %52

; <label>:52                                      ; preds = %60, %51
  %53 = load i32, i32* %i, align 4
  %54 = icmp slt i32 %53, 14
  br i1 %54, label %55, label %63

; <label>:55                                      ; preds = %52
  %56 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %57 = load i32, i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %58
  store %struct.rtattr* %56, %struct.rtattr** %59, align 8
  br label %60

; <label>:60                                      ; preds = %55
  %61 = load i32, i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %52

; <label>:63                                      ; preds = %52
  %64 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 1
  store %struct.rtattr* null, %struct.rtattr** %64, align 8
  %65 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %66 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %65, i32 0, i32 0
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = sub nsw i32 %68, 8
  %70 = trunc i32 %69 to i16
  store i16 %70, i16* %66, align 2
  %71 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %72 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 5
  store %struct.rtattr* %71, %struct.rtattr** %72, align 8
  %73 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i32 0
  %74 = call i32 @inet_check_attr(i8* null, %struct.rtattr** %73)
  %75 = icmp ne i32 %74, -22
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %63
  call void @abort() #4
  unreachable

; <label>:77                                      ; preds = %63
  store i32 0, i32* %i, align 4
  br label %78

; <label>:78                                      ; preds = %119, %77
  %79 = load i32, i32* %i, align 4
  %80 = icmp slt i32 %79, 14
  br i1 %80, label %81, label %122

; <label>:81                                      ; preds = %78
  %82 = load i32, i32* %i, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %84, label %91

; <label>:84                                      ; preds = %81
  %85 = load i32, i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %86
  %88 = load %struct.rtattr*, %struct.rtattr** %87, align 8
  %89 = icmp ne %struct.rtattr* %88, null
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %84
  call void @abort() #4
  unreachable

; <label>:91                                      ; preds = %84, %81
  %92 = load i32, i32* %i, align 4
  %93 = icmp ne i32 %92, 1
  br i1 %93, label %94, label %105

; <label>:94                                      ; preds = %91
  %95 = load i32, i32* %i, align 4
  %96 = icmp sle i32 %95, 5
  br i1 %96, label %97, label %105

; <label>:97                                      ; preds = %94
  %98 = load i32, i32* %i, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %99
  %101 = load %struct.rtattr*, %struct.rtattr** %100, align 8
  %102 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 1
  %103 = icmp ne %struct.rtattr* %101, %102
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %97
  call void @abort() #4
  unreachable

; <label>:105                                     ; preds = %97, %94, %91
  %106 = load i32, i32* %i, align 4
  %107 = icmp sgt i32 %106, 5
  br i1 %107, label %108, label %116

; <label>:108                                     ; preds = %105
  %109 = load i32, i32* %i, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [14 x %struct.rtattr*], [14 x %struct.rtattr*]* %rta, i32 0, i64 %110
  %112 = load %struct.rtattr*, %struct.rtattr** %111, align 8
  %113 = getelementptr inbounds [2 x %struct.rtattr], [2 x %struct.rtattr]* %rt, i32 0, i64 0
  %114 = icmp ne %struct.rtattr* %112, %113
  br i1 %114, label %115, label %116

; <label>:115                                     ; preds = %108
  call void @abort() #4
  unreachable

; <label>:116                                     ; preds = %108, %105
  br label %117

; <label>:117                                     ; preds = %116
  br label %118

; <label>:118                                     ; preds = %117
  br label %119

; <label>:119                                     ; preds = %118
  %120 = load i32, i32* %i, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %i, align 4
  br label %78

; <label>:122                                     ; preds = %78
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
