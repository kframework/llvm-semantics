; ModuleID = './20020129-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.B = type { %struct.C, %struct.A* }
%struct.C = type { %struct.D, i64, i64, i64, i64, i64 }
%struct.D = type { i32, %struct.D* }
%struct.A = type { %struct.A*, %struct.C* }

@y = common global %struct.B zeroinitializer, align 8
@x = common global %struct.B zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define void @foo(%struct.B* %x, %struct.B* %y) #0 {
  %1 = alloca %struct.B*, align 8
  %2 = alloca %struct.B*, align 8
  %a = alloca %struct.A*, align 8
  store %struct.B* %x, %struct.B** %1, align 8
  store %struct.B* %y, %struct.B** %2, align 8
  %3 = load %struct.B** %1, align 8
  %4 = getelementptr inbounds %struct.B* %3, i32 0, i32 1
  %5 = load %struct.A** %4, align 8
  %6 = icmp eq %struct.A* %5, null
  br i1 %6, label %7, label %28

; <label>:7                                       ; preds = %0
  %8 = load %struct.B** %2, align 8
  %9 = getelementptr inbounds %struct.B* %8, i32 0, i32 1
  %10 = load %struct.A** %9, align 8
  store %struct.A* %10, %struct.A** %a, align 8
  %11 = load %struct.B** %1, align 8
  %12 = getelementptr inbounds %struct.B* %11, i32 0, i32 1
  store %struct.A* %10, %struct.A** %12, align 8
  %13 = load %struct.B** %2, align 8
  %14 = getelementptr inbounds %struct.B* %13, i32 0, i32 1
  store %struct.A* null, %struct.A** %14, align 8
  br label %15

; <label>:15                                      ; preds = %23, %7
  %16 = load %struct.A** %a, align 8
  %17 = icmp ne %struct.A* %16, null
  br i1 %17, label %18, label %27

; <label>:18                                      ; preds = %15
  %19 = load %struct.B** %1, align 8
  %20 = getelementptr inbounds %struct.B* %19, i32 0, i32 0
  %21 = load %struct.A** %a, align 8
  %22 = getelementptr inbounds %struct.A* %21, i32 0, i32 1
  store %struct.C* %20, %struct.C** %22, align 8
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load %struct.A** %a, align 8
  %25 = getelementptr inbounds %struct.A* %24, i32 0, i32 0
  %26 = load %struct.A** %25, align 8
  store %struct.A* %26, %struct.A** %a, align 8
  br label %15

; <label>:27                                      ; preds = %15
  br label %28

; <label>:28                                      ; preds = %27, %0
  %29 = load %struct.B** %2, align 8
  %30 = getelementptr inbounds %struct.B* %29, i32 0, i32 1
  %31 = load %struct.A** %30, align 8
  %32 = icmp ne %struct.A* %31, null
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %28
  call void @abort() #2
  unreachable

; <label>:34                                      ; preds = %28
  %35 = load %struct.B** %1, align 8
  %36 = getelementptr inbounds %struct.B* %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.C* %36, i32 0, i32 2
  %38 = load i64* %37, align 8
  %39 = icmp eq i64 %38, -1
  br i1 %39, label %40, label %61

; <label>:40                                      ; preds = %34
  %41 = load %struct.B** %2, align 8
  %42 = getelementptr inbounds %struct.B* %41, i32 0, i32 0
  %43 = getelementptr inbounds %struct.C* %42, i32 0, i32 2
  %44 = load i64* %43, align 8
  %45 = load %struct.B** %1, align 8
  %46 = getelementptr inbounds %struct.B* %45, i32 0, i32 0
  %47 = getelementptr inbounds %struct.C* %46, i32 0, i32 2
  store i64 %44, i64* %47, align 8
  %48 = load %struct.B** %2, align 8
  %49 = getelementptr inbounds %struct.B* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.C* %49, i32 0, i32 3
  %51 = load i64* %50, align 8
  %52 = load %struct.B** %1, align 8
  %53 = getelementptr inbounds %struct.B* %52, i32 0, i32 0
  %54 = getelementptr inbounds %struct.C* %53, i32 0, i32 3
  store i64 %51, i64* %54, align 8
  %55 = load %struct.B** %2, align 8
  %56 = getelementptr inbounds %struct.B* %55, i32 0, i32 0
  %57 = getelementptr inbounds %struct.C* %56, i32 0, i32 2
  store i64 -1, i64* %57, align 8
  %58 = load %struct.B** %2, align 8
  %59 = getelementptr inbounds %struct.B* %58, i32 0, i32 0
  %60 = getelementptr inbounds %struct.C* %59, i32 0, i32 3
  store i64 0, i64* %60, align 8
  br label %61

; <label>:61                                      ; preds = %40, %34
  %62 = load %struct.B** %2, align 8
  %63 = getelementptr inbounds %struct.B* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.C* %63, i32 0, i32 2
  %65 = load i64* %64, align 8
  %66 = icmp ne i64 %65, -1
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %61
  call void @abort() #2
  unreachable

; <label>:68                                      ; preds = %61
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 6, i32* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 0, i32 0), align 4
  store i64 145, i64* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 2), align 8
  store i64 2448, i64* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 3), align 8
  store i64 -1, i64* getelementptr inbounds (%struct.B* @x, i32 0, i32 0, i32 2), align 8
  call void @foo(%struct.B* @x, %struct.B* @y)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
