; ModuleID = './pr28289.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@one = global i32 1, align 4

; Function Attrs: nounwind uwtable
define void @ix86_split_ashr(i32 %mode) #0 {
  %1 = alloca i32, align 4
  store i32 %mode, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  %4 = select i1 %3, i32 (i32)* @ok, i32 (i32)* @gen_x86_64_shrd
  %5 = call i32 %4(i32 0)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @ok(i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  call void @exit(i32 %3) #2
  unreachable
                                                  ; No predecessors!
  %5 = load i32, i32* %1
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @gen_x86_64_shrd(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i32, i32* @one, align 4
  call void @ix86_split_ashr(i32 %2)
  ret i32 1
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
