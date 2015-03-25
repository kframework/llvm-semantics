; ModuleID = './20020920-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.B = type { i32, i32 }
%struct.A = type { i32, %struct.B }

@f.b = private unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4

; Function Attrs: nounwind uwtable
define { i64, i32 } @f() #0 {
  %1 = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %2 = alloca { i64, i32 }
  %3 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %4 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %6 = bitcast %struct.B* %5 to i8*
  %7 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = bitcast %struct.A* %1 to i8*
  %9 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 4, i1 false)
  %10 = bitcast { i64, i32 }* %2 to i8*
  %11 = bitcast %struct.A* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 1, i1 false)
  %12 = load { i64, i32 }* %2
  ret { i64, i32 } %12
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = call { i64, i32 } @f()
  store { i64, i32 } %3, { i64, i32 }* %2
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %4, i64 12, i32 1, i1 false)
  %6 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp ne i32 %7, 2
  br i1 %8, label %19, label %9

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %11 = getelementptr inbounds %struct.B* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %19, label %14

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %16 = getelementptr inbounds %struct.B* %15, i32 0, i32 1
  %17 = load i32* %16, align 4
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %14, %9, %0
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %14
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %22 = load i32* %1
  ret i32 %22
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
