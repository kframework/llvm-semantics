; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

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
  %tmp = load double** %C.addr, align 8
  %tmp1 = load double** %Cref.addr, align 8
  %cmp = icmp ne double* %tmp, %tmp1
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
