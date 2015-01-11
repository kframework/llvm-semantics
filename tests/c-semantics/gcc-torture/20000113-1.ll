; ModuleID = './20000113-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.x = type { i8, [3 x i8] }

; Function Attrs: nounwind uwtable
define void @foobar(i32 %x, i32 %y, i32 %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %a = alloca %struct.x, align 4
  %b = alloca %struct.x, align 4
  %c = alloca %struct.x*, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %z, i32* %3, align 4
  %4 = bitcast %struct.x* %a to i8*
  %5 = load i32* %1, align 4
  %6 = trunc i32 %5 to i8
  %7 = load i8* %4, align 4
  %8 = and i8 %6, 1
  %9 = and i8 %7, -2
  %10 = or i8 %9, %8
  store i8 %10, i8* %4, align 4
  %11 = bitcast %struct.x* %a to i8*
  %12 = load i32* %2, align 4
  %13 = trunc i32 %12 to i8
  %14 = load i8* %11, align 4
  %15 = and i8 %13, 3
  %16 = shl i8 %15, 1
  %17 = and i8 %14, -7
  %18 = or i8 %17, %16
  store i8 %18, i8* %11, align 4
  %19 = bitcast %struct.x* %a to i8*
  %20 = load i32* %3, align 4
  %21 = trunc i32 %20 to i8
  %22 = load i8* %19, align 4
  %23 = and i8 %21, 7
  %24 = shl i8 %23, 3
  %25 = and i8 %22, -57
  %26 = or i8 %25, %24
  store i8 %26, i8* %19, align 4
  %27 = bitcast %struct.x* %b to i8*
  %28 = load i32* %1, align 4
  %29 = trunc i32 %28 to i8
  %30 = load i8* %27, align 4
  %31 = and i8 %29, 1
  %32 = and i8 %30, -2
  %33 = or i8 %32, %31
  store i8 %33, i8* %27, align 4
  %34 = bitcast %struct.x* %b to i8*
  %35 = load i32* %2, align 4
  %36 = trunc i32 %35 to i8
  %37 = load i8* %34, align 4
  %38 = and i8 %36, 3
  %39 = shl i8 %38, 1
  %40 = and i8 %37, -7
  %41 = or i8 %40, %39
  store i8 %41, i8* %34, align 4
  %42 = bitcast %struct.x* %b to i8*
  %43 = load i32* %3, align 4
  %44 = trunc i32 %43 to i8
  %45 = load i8* %42, align 4
  %46 = and i8 %44, 7
  %47 = shl i8 %46, 3
  %48 = and i8 %45, -57
  %49 = or i8 %48, %47
  store i8 %49, i8* %42, align 4
  store %struct.x* %b, %struct.x** %c, align 8
  %50 = bitcast %struct.x* %a to i8*
  %51 = load i8* %50, align 4
  %52 = lshr i8 %51, 1
  %53 = and i8 %52, 3
  %54 = zext i8 %53 to i32
  %55 = bitcast %struct.x* %a to i8*
  %56 = load i8* %55, align 4
  %57 = and i8 %56, 1
  %58 = zext i8 %57 to i32
  %59 = sub nsw i32 %54, %58
  %60 = load %struct.x** %c, align 8
  %61 = bitcast %struct.x* %60 to i8*
  %62 = load i8* %61, align 4
  %63 = lshr i8 %62, 1
  %64 = and i8 %63, 3
  %65 = zext i8 %64 to i32
  %66 = mul nsw i32 %59, %65
  %67 = load %struct.x** %c, align 8
  %68 = bitcast %struct.x* %67 to i8*
  %69 = load i8* %68, align 4
  %70 = lshr i8 %69, 3
  %71 = and i8 %70, 7
  %72 = zext i8 %71 to i32
  %73 = add nsw i32 %72, %66
  %74 = trunc i32 %73 to i8
  %75 = load i8* %68, align 4
  %76 = and i8 %74, 7
  %77 = shl i8 %76, 3
  %78 = and i8 %75, -57
  %79 = or i8 %78, %77
  store i8 %79, i8* %68, align 4
  %80 = zext i8 %76 to i32
  %81 = bitcast %struct.x* %a to i8*
  %82 = load i8* %81, align 4
  %83 = and i8 %82, 1
  %84 = zext i8 %83 to i32
  %85 = icmp ne i32 %84, 1
  br i1 %85, label %94, label %86

; <label>:86                                      ; preds = %0
  %87 = load %struct.x** %c, align 8
  %88 = bitcast %struct.x* %87 to i8*
  %89 = load i8* %88, align 4
  %90 = lshr i8 %89, 3
  %91 = and i8 %90, 7
  %92 = zext i8 %91 to i32
  %93 = icmp ne i32 %92, 5
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %86, %0
  call void @abort() #2
  unreachable

; <label>:95                                      ; preds = %86
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  call void @foobar(i32 1, i32 2, i32 3)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
