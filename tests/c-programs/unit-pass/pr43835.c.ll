; ModuleID = './pr43835.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.PMC = type { i32 }
%struct.Pcc_cell = type { %struct.PMC*, i64, i64 }

; Function Attrs: noinline nounwind uwtable
define void @Parrot_gc_mark_PMC_alive_fun(i32* %interp, %struct.PMC* %pmc) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.PMC*, align 8
  store i32* %interp, i32** %1, align 8
  store %struct.PMC* %pmc, %struct.PMC** %2, align 8
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo(i32* %interp, %struct.Pcc_cell* %c) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.Pcc_cell*, align 8
  store i32* %interp, i32** %1, align 8
  store %struct.Pcc_cell* %c, %struct.Pcc_cell** %2, align 8
  %3 = load i32*, i32** %1, align 8
  %4 = load %struct.Pcc_cell*, %struct.Pcc_cell** %2, align 8
  call void @mark_cell(i32* %3, %struct.Pcc_cell* %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @mark_cell(i32* nonnull %interp, %struct.Pcc_cell* nonnull %c) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.Pcc_cell*, align 8
  store i32* %interp, i32** %1, align 8
  store %struct.Pcc_cell* %c, %struct.Pcc_cell** %2, align 8
  %3 = load %struct.Pcc_cell*, %struct.Pcc_cell** %2, align 8
  %4 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %3, i32 0, i32 2
  %5 = load i64, i64* %4, align 8
  %6 = icmp eq i64 %5, 4
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %0
  %8 = load %struct.Pcc_cell*, %struct.Pcc_cell** %2, align 8
  %9 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %8, i32 0, i32 0
  %10 = load %struct.PMC*, %struct.PMC** %9, align 8
  %11 = icmp ne %struct.PMC* %10, null
  br i1 %11, label %12, label %25

; <label>:12                                      ; preds = %7
  %13 = load %struct.Pcc_cell*, %struct.Pcc_cell** %2, align 8
  %14 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %13, i32 0, i32 0
  %15 = load %struct.PMC*, %struct.PMC** %14, align 8
  %16 = getelementptr inbounds %struct.PMC, %struct.PMC* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 4
  %18 = and i32 %17, 262144
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %25, label %20

; <label>:20                                      ; preds = %12
  %21 = load i32*, i32** %1, align 8
  %22 = load %struct.Pcc_cell*, %struct.Pcc_cell** %2, align 8
  %23 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %22, i32 0, i32 0
  %24 = load %struct.PMC*, %struct.PMC** %23, align 8
  call void @Parrot_gc_mark_PMC_alive_fun(i32* %21, %struct.PMC* %24)
  br label %25

; <label>:25                                      ; preds = %20, %12, %7, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca %struct.Pcc_cell, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %c, i32 0, i32 0
  store %struct.PMC* null, %struct.PMC** %2, align 8
  %3 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %c, i32 0, i32 1
  store i64 42, i64* %3, align 8
  %4 = getelementptr inbounds %struct.Pcc_cell, %struct.Pcc_cell* %c, i32 0, i32 2
  store i64 4, i64* %4, align 8
  call void @foo(i32* %i, %struct.Pcc_cell* %c)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
