
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%a = type {i64, i64}
%b = type <{i1, x86_mmx, i1, i64}>

@.str = private unnamed_addr constant [11 x i8] c"'%d' '%d'\0A\00", align 1

@main.L = internal global [6 x i8*] [i8* blockaddress(@main, %entry), i8* blockaddress(@main, %b), i8* blockaddress(@main, %c), i8* blockaddress(@main, %d), i8* blockaddress(@f, %e), i8* null], align 16

define i32 @f() {
entry:
  br label %e
e:
  %x = add i32 1, 1
  ret i32 %x
}

define i32 @main() #0 {
entry:
  %z = add i32 1, 1
  %y = getelementptr [6 x i8*], [6 x i8*]* @main.L, i32 0, i32 %z
  %x = load i8*, i8** %y
  indirectbr i8* %x, [label %a, label %b, label %c]
a:
  ret i32 0
b: 
  ret i32 1
c:
  ret i32 2
d:
  ret i32 3
e:
  ret i32 4
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
