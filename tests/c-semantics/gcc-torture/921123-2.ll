; ModuleID = './921123-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.four_quarters = type { i16, i16, i16, i16 }

@b = common global i32 0, align 4
@a = common global i32 0, align 4
@x = common global %struct.four_quarters zeroinitializer, align 2

; Function Attrs: nounwind uwtable
define void @f(i64 %j.coerce) #0 {
  %j = alloca %struct.four_quarters, align 8
  %1 = bitcast %struct.four_quarters* %j to i64*
  store i64 %j.coerce, i64* %1, align 1
  %2 = getelementptr inbounds %struct.four_quarters* %j, i32 0, i32 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  store i32 %4, i32* @b, align 4
  %5 = getelementptr inbounds %struct.four_quarters* %j, i32 0, i32 3
  %6 = load i16* %5, align 2
  %7 = zext i16 %6 to i32
  store i32 %7, i32* @a, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.four_quarters, align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 2
  store i16 0, i16* %2, align 2
  %3 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 1
  store i16 0, i16* %3, align 2
  %4 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 0
  store i16 0, i16* %4, align 2
  %5 = getelementptr inbounds %struct.four_quarters* %x, i32 0, i32 3
  store i16 38, i16* %5, align 2
  %6 = bitcast %struct.four_quarters* %x to i64*
  %7 = load i64* %6, align 1
  call void @f(i64 %7)
  %8 = load i32* @a, align 4
  %9 = icmp ne i32 %8, 38
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
