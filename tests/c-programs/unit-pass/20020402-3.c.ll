; ModuleID = './20020402-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.blockvector = type { i32, [2 x %struct.block*] }
%struct.block = type { i64, i64, %struct.symbol*, %struct.block*, i8, i32, [1 x %struct.symbol] }
%struct.symbol = type { i32, i8* }
%struct.symtab = type { %struct.blockvector* }

; Function Attrs: nounwind uwtable
define %struct.blockvector* @blockvector_for_pc_sect(i64 %pc, %struct.symtab* %symtab) #0 {
  %1 = alloca %struct.blockvector*, align 8
  %2 = alloca i64, align 8
  %3 = alloca %struct.symtab*, align 8
  %b = alloca %struct.block*, align 8
  %bot = alloca i32, align 4
  %top = alloca i32, align 4
  %half = alloca i32, align 4
  %bl = alloca %struct.blockvector*, align 8
  store i64 %pc, i64* %2, align 8
  store %struct.symtab* %symtab, %struct.symtab** %3, align 8
  %4 = load %struct.symtab*, %struct.symtab** %3, align 8
  %5 = getelementptr inbounds %struct.symtab, %struct.symtab* %4, i32 0, i32 0
  %6 = load %struct.blockvector*, %struct.blockvector** %5, align 8
  store %struct.blockvector* %6, %struct.blockvector** %bl, align 8
  %7 = load %struct.blockvector*, %struct.blockvector** %bl, align 8
  %8 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %7, i32 0, i32 1
  %9 = getelementptr inbounds [2 x %struct.block*], [2 x %struct.block*]* %8, i32 0, i64 0
  %10 = load %struct.block*, %struct.block** %9, align 8
  store %struct.block* %10, %struct.block** %b, align 8
  store i32 0, i32* %bot, align 4
  %11 = load %struct.blockvector*, %struct.blockvector** %bl, align 8
  %12 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %top, align 4
  br label %14

; <label>:14                                      ; preds = %46, %0
  %15 = load i32, i32* %top, align 4
  %16 = load i32, i32* %bot, align 4
  %17 = sub nsw i32 %15, %16
  %18 = icmp sgt i32 %17, 1
  br i1 %18, label %19, label %47

; <label>:19                                      ; preds = %14
  %20 = load i32, i32* %top, align 4
  %21 = load i32, i32* %bot, align 4
  %22 = sub nsw i32 %20, %21
  %23 = add nsw i32 %22, 1
  %24 = ashr i32 %23, 1
  store i32 %24, i32* %half, align 4
  %25 = load i32, i32* %bot, align 4
  %26 = load i32, i32* %half, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load %struct.blockvector*, %struct.blockvector** %bl, align 8
  %30 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %29, i32 0, i32 1
  %31 = getelementptr inbounds [2 x %struct.block*], [2 x %struct.block*]* %30, i32 0, i64 %28
  %32 = load %struct.block*, %struct.block** %31, align 8
  store %struct.block* %32, %struct.block** %b, align 8
  %33 = load %struct.block*, %struct.block** %b, align 8
  %34 = getelementptr inbounds %struct.block, %struct.block* %33, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = load i64, i64* %2, align 8
  %37 = icmp ule i64 %35, %36
  br i1 %37, label %38, label %42

; <label>:38                                      ; preds = %19
  %39 = load i32, i32* %half, align 4
  %40 = load i32, i32* %bot, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %bot, align 4
  br label %46

; <label>:42                                      ; preds = %19
  %43 = load i32, i32* %bot, align 4
  %44 = load i32, i32* %half, align 4
  %45 = add nsw i32 %43, %44
  store i32 %45, i32* %top, align 4
  br label %46

; <label>:46                                      ; preds = %42, %38
  br label %14

; <label>:47                                      ; preds = %14
  br label %48

; <label>:48                                      ; preds = %65, %47
  %49 = load i32, i32* %bot, align 4
  %50 = icmp sge i32 %49, 0
  br i1 %50, label %51, label %68

; <label>:51                                      ; preds = %48
  %52 = load i32, i32* %bot, align 4
  %53 = sext i32 %52 to i64
  %54 = load %struct.blockvector*, %struct.blockvector** %bl, align 8
  %55 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %54, i32 0, i32 1
  %56 = getelementptr inbounds [2 x %struct.block*], [2 x %struct.block*]* %55, i32 0, i64 %53
  %57 = load %struct.block*, %struct.block** %56, align 8
  store %struct.block* %57, %struct.block** %b, align 8
  %58 = load %struct.block*, %struct.block** %b, align 8
  %59 = getelementptr inbounds %struct.block, %struct.block* %58, i32 0, i32 1
  %60 = load i64, i64* %59, align 8
  %61 = load i64, i64* %2, align 8
  %62 = icmp ugt i64 %60, %61
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %51
  %64 = load %struct.blockvector*, %struct.blockvector** %bl, align 8
  store %struct.blockvector* %64, %struct.blockvector** %1
  br label %69

; <label>:65                                      ; preds = %51
  %66 = load i32, i32* %bot, align 4
  %67 = add nsw i32 %66, -1
  store i32 %67, i32* %bot, align 4
  br label %48

; <label>:68                                      ; preds = %48
  store %struct.blockvector* null, %struct.blockvector** %1
  br label %69

; <label>:69                                      ; preds = %68, %63
  %70 = load %struct.blockvector*, %struct.blockvector** %1
  ret %struct.blockvector* %70
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.block, align 8
  %b = alloca %struct.block, align 8
  %bv = alloca %struct.blockvector, align 8
  %s = alloca %struct.symtab, align 8
  %ret = alloca %struct.blockvector*, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.block* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 56, i32 8, i1 false)
  %3 = bitcast i8* %2 to %struct.block*
  %4 = getelementptr %struct.block, %struct.block* %3, i32 0, i32 1
  store i64 65536, i64* %4
  %5 = getelementptr %struct.block, %struct.block* %3, i32 0, i32 4
  store i8 1, i8* %5
  %6 = getelementptr %struct.block, %struct.block* %3, i32 0, i32 5
  store i32 20, i32* %6
  %7 = bitcast %struct.block* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 56, i32 8, i1 false)
  %8 = bitcast i8* %7 to %struct.block*
  %9 = getelementptr %struct.block, %struct.block* %8, i32 0, i32 0
  store i64 65536, i64* %9
  %10 = getelementptr %struct.block, %struct.block* %8, i32 0, i32 1
  store i64 131072, i64* %10
  %11 = getelementptr %struct.block, %struct.block* %8, i32 0, i32 4
  store i8 1, i8* %11
  %12 = getelementptr %struct.block, %struct.block* %8, i32 0, i32 5
  store i32 20, i32* %12
  %13 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %bv, i32 0, i32 0
  store i32 2, i32* %13, align 4
  %14 = getelementptr inbounds %struct.blockvector, %struct.blockvector* %bv, i32 0, i32 1
  %15 = getelementptr inbounds [2 x %struct.block*], [2 x %struct.block*]* %14, i64 0, i64 0
  store %struct.block* %a, %struct.block** %15
  %16 = getelementptr inbounds %struct.block*, %struct.block** %15, i64 1
  store %struct.block* %b, %struct.block** %16
  %17 = getelementptr inbounds %struct.symtab, %struct.symtab* %s, i32 0, i32 0
  store %struct.blockvector* %bv, %struct.blockvector** %17, align 8
  %18 = call %struct.blockvector* @blockvector_for_pc_sect(i64 1280, %struct.symtab* %s)
  store %struct.blockvector* %18, %struct.blockvector** %ret, align 8
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
