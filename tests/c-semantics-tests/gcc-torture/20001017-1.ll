; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bug(double* %Cref, i8 signext %transb, i32 %m, i32 %n, i32 %k, double %a, double* %A, i32 %fdA, double* %B, i32 %fdB, double %b, double* %C, i32 %fdC) nounwind uwtable {
entry:
  %Cref.addr = alloca double*, align 8
  %transb.addr = alloca i8, align 1
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %a.addr = alloca double, align 8
  %A.addr = alloca double*, align 8
  %fdA.addr = alloca i32, align 4
  %B.addr = alloca double*, align 8
  %fdB.addr = alloca i32, align 4
  %b.addr = alloca double, align 8
  %C.addr = alloca double*, align 8
  %fdC.addr = alloca i32, align 4
  store double* %Cref, double** %Cref.addr, align 8
  store i8 %transb, i8* %transb.addr, align 1
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store double %a, double* %a.addr, align 8
  store double* %A, double** %A.addr, align 8
  store i32 %fdA, i32* %fdA.addr, align 4
  store double* %B, double** %B.addr, align 8
  store i32 %fdB, i32* %fdB.addr, align 4
  store double %b, double* %b.addr, align 8
  store double* %C, double** %C.addr, align 8
  store i32 %fdC, i32* %fdC.addr, align 4
  %0 = load double** %C.addr, align 8
  %1 = load double** %Cref.addr, align 8
  %cmp = icmp ne double* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %A = alloca [1 x double], align 8
  %B = alloca [1 x double], align 8
  %C = alloca [1 x double], align 8
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [1 x double]* %C, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [1 x double]* %A, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x double]* %B, i32 0, i32 0
  %arraydecay3 = getelementptr inbounds [1 x double]* %C, i32 0, i32 0
  call void @bug(double* %arraydecay, i8 signext 66, i32 1, i32 2, i32 3, double 4.000000e+00, double* %arraydecay1, i32 5, double* %arraydecay2, i32 6, double 7.000000e+00, double* %arraydecay3, i32 8)
  ret i32 0
}
