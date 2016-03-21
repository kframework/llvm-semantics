; ModuleID = './921112-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.u = type { double }
%struct.anon = type { i32, i32 }

@x = common global [2 x %union.u] zeroinitializer, align 16
@v = common global %union.u zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define void @f(%union.u* %x, i64 %v.coerce) #0 {
  %v = alloca %union.u, align 8
  %1 = alloca %union.u*, align 8
  %2 = getelementptr %union.u, %union.u* %v, i32 0, i32 0
  %3 = bitcast double* %2 to i64*
  store i64 %v.coerce, i64* %3, align 8
  store %union.u* %x, %union.u** %1, align 8
  %4 = load %union.u*, %union.u** %1, align 8
  %5 = getelementptr inbounds %union.u, %union.u* %4, i32 1
  store %union.u* %5, %union.u** %1, align 8
  %6 = bitcast %union.u* %5 to i8*
  %7 = bitcast %union.u* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u], [2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u], [2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 0), align 4
  store i32 1, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* @v to %struct.anon*), i32 0, i32 0), align 4
  store i32 2, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* @v to %struct.anon*), i32 0, i32 1), align 4
  %2 = load i64, i64* bitcast (%union.u* @v to i64*), align 8
  call void @f(%union.u* getelementptr inbounds ([2 x %union.u], [2 x %union.u]* @x, i32 0, i32 0), i64 %2)
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u], [2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 0), align 4
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u], [2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 1), align 4
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
}

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
