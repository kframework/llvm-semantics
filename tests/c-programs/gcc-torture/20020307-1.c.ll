; ModuleID = './20020307-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f3(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 7
  %4 = icmp uge i64 %3, 6
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @f4(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 15
  %4 = icmp uge i64 %3, 10
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f5(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 31
  %4 = icmp uge i64 %3, 18
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f6(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 63
  %4 = icmp uge i64 %3, 34
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f7(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 127
  %4 = icmp uge i64 %3, 66
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f8(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 255
  %4 = icmp uge i64 %3, 130
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f9(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 511
  %4 = icmp uge i64 %3, 258
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f10(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 1023
  %4 = icmp uge i64 %3, 514
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f11(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 2047
  %4 = icmp uge i64 %3, 1026
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f12(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 4095
  %4 = icmp uge i64 %3, 2050
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f13(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 8191
  %4 = icmp uge i64 %3, 4098
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f14(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 16383
  %4 = icmp uge i64 %3, 8194
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f15(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 32767
  %4 = icmp uge i64 %3, 16386
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f16(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 65535
  %4 = icmp uge i64 %3, 32770
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f17(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 131071
  %4 = icmp uge i64 %3, 65538
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f18(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 262143
  %4 = icmp uge i64 %3, 131074
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f19(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 524287
  %4 = icmp uge i64 %3, 262146
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f20(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 1048575
  %4 = icmp uge i64 %3, 524290
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f21(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 2097151
  %4 = icmp uge i64 %3, 1048578
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f22(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 4194303
  %4 = icmp uge i64 %3, 2097154
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f23(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 8388607
  %4 = icmp uge i64 %3, 4194306
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f24(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 16777215
  %4 = icmp uge i64 %3, 8388610
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f25(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 33554431
  %4 = icmp uge i64 %3, 16777218
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f26(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 67108863
  %4 = icmp uge i64 %3, 33554434
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f27(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 134217727
  %4 = icmp uge i64 %3, 67108866
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f28(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 268435455
  %4 = icmp uge i64 %3, 134217730
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f29(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 536870911
  %4 = icmp uge i64 %3, 268435458
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f30(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 1073741823
  %4 = icmp uge i64 %3, 536870914
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f31(i64 %j) #0 {
  %1 = alloca i64, align 8
  store i64 %j, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = and i64 %2, 2147483647
  %4 = icmp uge i64 %3, 1073741826
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f3(i64 0)
  call void @f4(i64 0)
  call void @f5(i64 0)
  call void @f6(i64 0)
  call void @f7(i64 0)
  call void @f8(i64 0)
  call void @f9(i64 0)
  call void @f10(i64 0)
  call void @f11(i64 0)
  call void @f12(i64 0)
  call void @f13(i64 0)
  call void @f14(i64 0)
  call void @f15(i64 0)
  call void @f16(i64 0)
  call void @f17(i64 0)
  call void @f18(i64 0)
  call void @f19(i64 0)
  call void @f20(i64 0)
  call void @f21(i64 0)
  call void @f22(i64 0)
  call void @f23(i64 0)
  call void @f24(i64 0)
  call void @f25(i64 0)
  call void @f26(i64 0)
  call void @f27(i64 0)
  call void @f28(i64 0)
  call void @f29(i64 0)
  call void @f30(i64 0)
  call void @f31(i64 0)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
