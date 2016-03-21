; ModuleID = './strct-pack-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type <{ i16, [2 x i16*] }>

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %a = alloca %struct.A, align 2
  %ap = alloca %struct.A*, align 8
  store i32 0, i32* %1
  store i16 1, i16* %j, align 2
  store %struct.A* %a, %struct.A** %ap, align 8
  %2 = load i16, i16* %j, align 2
  %3 = sext i16 %2 to i64
  %4 = load %struct.A*, %struct.A** %ap, align 8
  %5 = getelementptr inbounds %struct.A, %struct.A* %4, i32 0, i32 1
  %6 = getelementptr inbounds [2 x i16*], [2 x i16*]* %5, i32 0, i64 %3
  store i16* %i, i16** %6, align 2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
