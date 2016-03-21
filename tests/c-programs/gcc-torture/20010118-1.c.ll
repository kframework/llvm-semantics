; ModuleID = './20010118-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32, i32, i32, i32, i32, i32 }

@main.w = private unnamed_addr constant %struct.A { i32 100, i32 110, i32 20, i32 30, i32 -1, i32 -1 }, align 4

; Function Attrs: nounwind uwtable
define void @foo(%struct.A* %v, i32 %w, i32 %x, i32* %y, i32* %z) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  store %struct.A* %v, %struct.A** %1, align 8
  store i32 %w, i32* %2, align 4
  store i32 %x, i32* %3, align 4
  store i32* %y, i32** %4, align 8
  store i32* %z, i32** %5, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @bar(%struct.A* %v, i32 %x, i32 %y, i32 %w, i32 %h) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %oldw = alloca i32, align 4
  %oldh = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %dx = alloca i32, align 4
  %dy = alloca i32, align 4
  store %struct.A* %v, %struct.A** %1, align 8
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  store i32 %w, i32* %4, align 4
  store i32 %h, i32* %5, align 4
  %6 = load %struct.A*, %struct.A** %1, align 8
  %7 = getelementptr inbounds %struct.A, %struct.A* %6, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %8, %9
  br i1 %10, label %17, label %11

; <label>:11                                      ; preds = %0
  %12 = load %struct.A*, %struct.A** %1, align 8
  %13 = getelementptr inbounds %struct.A, %struct.A* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = load i32, i32* %3, align 4
  %16 = icmp ne i32 %14, %15
  br i1 %16, label %17, label %63

; <label>:17                                      ; preds = %11, %0
  %18 = load i32, i32* %4, align 4
  store i32 %18, i32* %oldw, align 4
  %19 = load i32, i32* %5, align 4
  store i32 %19, i32* %oldh, align 4
  %20 = load %struct.A*, %struct.A** %1, align 8
  %21 = getelementptr inbounds %struct.A, %struct.A* %20, i32 0, i32 4
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %e, align 4
  %23 = load %struct.A*, %struct.A** %1, align 8
  %24 = getelementptr inbounds %struct.A, %struct.A* %23, i32 0, i32 5
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %f, align 4
  %26 = load %struct.A*, %struct.A** %1, align 8
  call void @foo(%struct.A* %26, i32 0, i32 0, i32* %4, i32* %5)
  %27 = load i32, i32* %oldw, align 4
  %28 = load i32, i32* %4, align 4
  %29 = sub nsw i32 %27, %28
  %30 = sitofp i32 %29 to double
  %31 = load i32, i32* %e, align 4
  %32 = sitofp i32 %31 to double
  %33 = fmul double %30, %32
  %34 = fdiv double %33, 2.000000e+00
  %35 = fptosi double %34 to i32
  store i32 %35, i32* %dx, align 4
  %36 = load i32, i32* %oldh, align 4
  %37 = load i32, i32* %5, align 4
  %38 = sub nsw i32 %36, %37
  %39 = sitofp i32 %38 to double
  %40 = load i32, i32* %f, align 4
  %41 = sitofp i32 %40 to double
  %42 = fmul double %39, %41
  %43 = fdiv double %42, 2.000000e+00
  %44 = fptosi double %43 to i32
  store i32 %44, i32* %dy, align 4
  %45 = load i32, i32* %dx, align 4
  %46 = load i32, i32* %2, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, i32* %2, align 4
  %48 = load i32, i32* %dy, align 4
  %49 = load i32, i32* %3, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, i32* %3, align 4
  %51 = load i32, i32* %2, align 4
  %52 = load %struct.A*, %struct.A** %1, align 8
  %53 = getelementptr inbounds %struct.A, %struct.A* %52, i32 0, i32 0
  store i32 %51, i32* %53, align 4
  %54 = load i32, i32* %3, align 4
  %55 = load %struct.A*, %struct.A** %1, align 8
  %56 = getelementptr inbounds %struct.A, %struct.A* %55, i32 0, i32 1
  store i32 %54, i32* %56, align 4
  %57 = load i32, i32* %4, align 4
  %58 = load %struct.A*, %struct.A** %1, align 8
  %59 = getelementptr inbounds %struct.A, %struct.A* %58, i32 0, i32 2
  store i32 %57, i32* %59, align 4
  %60 = load i32, i32* %5, align 4
  %61 = load %struct.A*, %struct.A** %1, align 8
  %62 = getelementptr inbounds %struct.A, %struct.A* %61, i32 0, i32 3
  store i32 %60, i32* %62, align 4
  br label %63

; <label>:63                                      ; preds = %17, %11
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %w = alloca %struct.A, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.A* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.A* @main.w to i8*), i64 24, i32 4, i1 false)
  call void @bar(%struct.A* %w, i32 400, i32 420, i32 50, i32 70)
  %3 = getelementptr inbounds %struct.A, %struct.A* %w, i32 0, i32 3
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 70
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %9 = load i32, i32* %1
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
