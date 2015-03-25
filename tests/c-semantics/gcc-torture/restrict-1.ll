; ModuleID = './restrict-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32 }

@main.a = private unnamed_addr constant %struct.A { i32 1, i32 0 }, align 4

; Function Attrs: nounwind uwtable
define void @bar(%struct.A* noalias %p) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca %struct.A, align 4
  store %struct.A* %p, %struct.A** %1, align 8
  %3 = load %struct.A** %1, align 8
  %4 = load %struct.A** %1, align 8
  %5 = load %struct.A** %1, align 8
  %6 = call i64 @foo(%struct.A* %4, %struct.A* %5)
  %7 = bitcast %struct.A* %2 to i64*
  store i64 %6, i64* %7, align 1
  %8 = bitcast %struct.A* %3 to i8*
  %9 = bitcast %struct.A* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 8, i32 4, i1 false)
  %10 = load %struct.A** %1, align 8
  %11 = getelementptr inbounds %struct.A* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #4
  unreachable

; <label>:15                                      ; preds = %0
  ret void
}

declare i64 @foo(%struct.A*, %struct.A*) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.A* @main.a to i8*), i64 8, i32 4, i1 false)
  call void @bar(%struct.A* %a)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
