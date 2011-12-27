; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/conversion.c'
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

define float @u2f(i32 %u) nounwind uwtable {
entry:
  %u.addr = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %tmp = load i32* %u.addr, align 4
  %conv = uitofp i32 %tmp to float
  ret float %conv
}

define double @u2d(i32 %u) nounwind uwtable {
entry:
  %u.addr = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %tmp = load i32* %u.addr, align 4
  %conv = uitofp i32 %tmp to double
  ret double %conv
}

define x86_fp80 @u2ld(i32 %u) nounwind uwtable {
entry:
  %u.addr = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %tmp = load i32* %u.addr, align 4
  %conv = uitofp i32 %tmp to x86_fp80
  ret x86_fp80 %conv
}

define float @s2f(i32 %s) nounwind uwtable {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %tmp = load i32* %s.addr, align 4
  %conv = sitofp i32 %tmp to float
  ret float %conv
}

define double @s2d(i32 %s) nounwind uwtable {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %tmp = load i32* %s.addr, align 4
  %conv = sitofp i32 %tmp to double
  ret double %conv
}

define x86_fp80 @s2ld(i32 %s) nounwind uwtable {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  %tmp = load i32* %s.addr, align 4
  %conv = sitofp i32 %tmp to x86_fp80
  ret x86_fp80 %conv
}

define i32 @fnear(float %x, float %y) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  %y.addr = alloca float, align 4
  %t = alloca float, align 4
  store float %x, float* %x.addr, align 4
  store float %y, float* %y.addr, align 4
  %tmp = load float* %x.addr, align 4
  %tmp1 = load float* %y.addr, align 4
  %sub = fsub float %tmp, %tmp1
  store float %sub, float* %t, align 4
  %tmp2 = load float* %t, align 4
  %cmp = fcmp oeq float %tmp2, 0.000000e+00
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = load float* %x.addr, align 4
  %tmp4 = load float* %t, align 4
  %div = fdiv float %tmp3, %tmp4
  %conv = fpext float %div to double
  %cmp5 = fcmp ogt double %conv, 1.000000e+06
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp5, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @dnear(double %x, double %y) nounwind uwtable {
entry:
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %t = alloca double, align 8
  store double %x, double* %x.addr, align 8
  store double %y, double* %y.addr, align 8
  %tmp = load double* %x.addr, align 8
  %tmp1 = load double* %y.addr, align 8
  %sub = fsub double %tmp, %tmp1
  store double %sub, double* %t, align 8
  %tmp2 = load double* %t, align 8
  %cmp = fcmp oeq double %tmp2, 0.000000e+00
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = load double* %x.addr, align 8
  %tmp4 = load double* %t, align 8
  %div = fdiv double %tmp3, %tmp4
  %cmp5 = fcmp ogt double %div, 1.000000e+14
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp5, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @ldnear(x86_fp80 %x, x86_fp80 %y) nounwind uwtable {
entry:
  %x.addr = alloca x86_fp80, align 16
  %y.addr = alloca x86_fp80, align 16
  %t = alloca x86_fp80, align 16
  store x86_fp80 %x, x86_fp80* %x.addr, align 16
  store x86_fp80 %y, x86_fp80* %y.addr, align 16
  %tmp = load x86_fp80* %x.addr, align 16
  %tmp1 = load x86_fp80* %y.addr, align 16
  %sub = fsub x86_fp80 %tmp, %tmp1
  store x86_fp80 %sub, x86_fp80* %t, align 16
  %tmp2 = load x86_fp80* %t, align 16
  %cmp = fcmp oeq x86_fp80 %tmp2, 0xK00000000000000000000
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %tmp3 = load x86_fp80* %x.addr, align 16
  %tmp4 = load x86_fp80* %t, align 16
  %div = fdiv x86_fp80 %tmp3, %tmp4
  %cmp5 = fcmp ogt x86_fp80 %div, 0xK40699DC5ADA82B70B800
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp5, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define void @test_integer_to_float() nounwind uwtable {
entry:
  %call = call float (...)* bitcast (float (i32)* @u2f to float (...)*)(i32 0)
  %cmp = fcmp une float %call, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call float (...)* bitcast (float (i32)* @u2f to float (...)*)(i32 -1)
  %call2 = call i32 @fnear(float %call1, float 0x41F0000000000000)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call float (...)* bitcast (float (i32)* @u2f to float (...)*)(i32 2147483647)
  %call6 = call i32 @fnear(float %call5, float 0x41E0000000000000)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end4
  %call10 = call float (...)* bitcast (float (i32)* @u2f to float (...)*)(i32 -2147483648)
  %cmp11 = fcmp une float %call10, 0x41E0000000000000
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end9
  %call14 = call double (...)* bitcast (double (i32)* @u2d to double (...)*)(i32 0)
  %cmp15 = fcmp une double %call14, 0.000000e+00
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  %call18 = call double (...)* bitcast (double (i32)* @u2d to double (...)*)(i32 -1)
  %call19 = call i32 @dnear(double %call18, double 0x41EFFFFFFFE00000)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end17
  %call23 = call double (...)* bitcast (double (i32)* @u2d to double (...)*)(i32 2147483647)
  %call24 = call i32 @dnear(double %call23, double 0x41DFFFFFFFC00000)
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end22
  %call28 = call double (...)* bitcast (double (i32)* @u2d to double (...)*)(i32 -2147483648)
  %cmp29 = fcmp une double %call28, 0x41E0000000000000
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end27
  %call32 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @u2ld to x86_fp80 (...)*)(i32 0)
  %cmp33 = fcmp une x86_fp80 %call32, 0xK00000000000000000000
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end31
  call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end31
  %call36 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @u2ld to x86_fp80 (...)*)(i32 -1)
  %call37 = call i32 @ldnear(x86_fp80 %call36, x86_fp80 0xK401EFFFFFFFF00000000)
  %tobool38 = icmp ne i32 %call37, 0
  br i1 %tobool38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end35
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end35
  %call41 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @u2ld to x86_fp80 (...)*)(i32 2147483647)
  %call42 = call i32 @ldnear(x86_fp80 %call41, x86_fp80 0xK401DFFFFFFFE00000000)
  %tobool43 = icmp ne i32 %call42, 0
  br i1 %tobool43, label %if.end45, label %if.then44

if.then44:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %if.end40
  %call46 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @u2ld to x86_fp80 (...)*)(i32 -2147483648)
  %cmp47 = fcmp une x86_fp80 %call46, 0xK401E8000000000000000
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end45
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end45
  %call50 = call float (...)* bitcast (float (i32)* @s2f to float (...)*)(i32 0)
  %cmp51 = fcmp une float %call50, 0.000000e+00
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  %call54 = call float (...)* bitcast (float (i32)* @s2f to float (...)*)(i32 -1)
  %call55 = call i32 @fnear(float %call54, float -1.000000e+00)
  %tobool56 = icmp ne i32 %call55, 0
  br i1 %tobool56, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end53
  %call59 = call float (...)* bitcast (float (i32)* @s2f to float (...)*)(i32 2147483647)
  %call60 = call i32 @fnear(float %call59, float 0x41E0000000000000)
  %tobool61 = icmp ne i32 %call60, 0
  br i1 %tobool61, label %if.end63, label %if.then62

if.then62:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end63:                                         ; preds = %if.end58
  %call64 = call float (...)* bitcast (float (i32)* @s2f to float (...)*)(i32 -2147483648)
  %cmp65 = fcmp une float %call64, 0xC1E0000000000000
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end63
  call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end63
  %call68 = call double (...)* bitcast (double (i32)* @s2d to double (...)*)(i32 0)
  %cmp69 = fcmp une double %call68, 0.000000e+00
  br i1 %cmp69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end67
  call void @abort() noreturn nounwind
  unreachable

if.end71:                                         ; preds = %if.end67
  %call72 = call double (...)* bitcast (double (i32)* @s2d to double (...)*)(i32 -1)
  %call73 = call i32 @dnear(double %call72, double -1.000000e+00)
  %tobool74 = icmp ne i32 %call73, 0
  br i1 %tobool74, label %if.end76, label %if.then75

if.then75:                                        ; preds = %if.end71
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end71
  %call77 = call double (...)* bitcast (double (i32)* @s2d to double (...)*)(i32 2147483647)
  %call78 = call i32 @dnear(double %call77, double 0x41DFFFFFFFC00000)
  %tobool79 = icmp ne i32 %call78, 0
  br i1 %tobool79, label %if.end81, label %if.then80

if.then80:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end81:                                         ; preds = %if.end76
  %call82 = call double (...)* bitcast (double (i32)* @s2d to double (...)*)(i32 -2147483648)
  %cmp83 = fcmp une double %call82, 0xC1E0000000000000
  br i1 %cmp83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end81
  call void @abort() noreturn nounwind
  unreachable

if.end85:                                         ; preds = %if.end81
  %call86 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @s2ld to x86_fp80 (...)*)(i32 0)
  %cmp87 = fcmp une x86_fp80 %call86, 0xK00000000000000000000
  br i1 %cmp87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end85
  call void @abort() noreturn nounwind
  unreachable

if.end89:                                         ; preds = %if.end85
  %call90 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @s2ld to x86_fp80 (...)*)(i32 -1)
  %call91 = call i32 @ldnear(x86_fp80 %call90, x86_fp80 0xKBFFF8000000000000000)
  %tobool92 = icmp ne i32 %call91, 0
  br i1 %tobool92, label %if.end94, label %if.then93

if.then93:                                        ; preds = %if.end89
  call void @abort() noreturn nounwind
  unreachable

if.end94:                                         ; preds = %if.end89
  %call95 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @s2ld to x86_fp80 (...)*)(i32 2147483647)
  %call96 = call i32 @ldnear(x86_fp80 %call95, x86_fp80 0xK401DFFFFFFFE00000000)
  %tobool97 = icmp ne i32 %call96, 0
  br i1 %tobool97, label %if.end99, label %if.then98

if.then98:                                        ; preds = %if.end94
  call void @abort() noreturn nounwind
  unreachable

if.end99:                                         ; preds = %if.end94
  %call100 = call x86_fp80 (...)* bitcast (x86_fp80 (i32)* @s2ld to x86_fp80 (...)*)(i32 -2147483648)
  %cmp101 = fcmp une x86_fp80 %call100, 0xKC01E8000000000000000
  br i1 %cmp101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end99
  call void @abort() noreturn nounwind
  unreachable

if.end103:                                        ; preds = %if.end99
  ret void
}

declare void @abort() noreturn nounwind

define float @ull2f(i64 %u) nounwind uwtable {
entry:
  %u.addr = alloca i64, align 8
  store i64 %u, i64* %u.addr, align 8
  %tmp = load i64* %u.addr, align 8
  %conv = uitofp i64 %tmp to float
  ret float %conv
}

define double @ull2d(i64 %u) nounwind uwtable {
entry:
  %u.addr = alloca i64, align 8
  store i64 %u, i64* %u.addr, align 8
  %tmp = load i64* %u.addr, align 8
  %conv = uitofp i64 %tmp to double
  ret double %conv
}

define x86_fp80 @ull2ld(i64 %u) nounwind uwtable {
entry:
  %u.addr = alloca i64, align 8
  store i64 %u, i64* %u.addr, align 8
  %tmp = load i64* %u.addr, align 8
  %conv = uitofp i64 %tmp to x86_fp80
  ret x86_fp80 %conv
}

define float @sll2f(i64 %s) nounwind uwtable {
entry:
  %s.addr = alloca i64, align 8
  store i64 %s, i64* %s.addr, align 8
  %tmp = load i64* %s.addr, align 8
  %conv = sitofp i64 %tmp to float
  ret float %conv
}

define double @sll2d(i64 %s) nounwind uwtable {
entry:
  %s.addr = alloca i64, align 8
  store i64 %s, i64* %s.addr, align 8
  %tmp = load i64* %s.addr, align 8
  %conv = sitofp i64 %tmp to double
  ret double %conv
}

define x86_fp80 @sll2ld(i64 %s) nounwind uwtable {
entry:
  %s.addr = alloca i64, align 8
  store i64 %s, i64* %s.addr, align 8
  %tmp = load i64* %s.addr, align 8
  %conv = sitofp i64 %tmp to x86_fp80
  ret x86_fp80 %conv
}

define void @test_longlong_integer_to_float() nounwind uwtable {
entry:
  %call = call float (...)* bitcast (float (i64)* @ull2f to float (...)*)(i64 0)
  %cmp = fcmp une float %call, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call float (...)* bitcast (float (i64)* @ull2f to float (...)*)(i64 -1)
  %cmp2 = fcmp une float %call1, 0x43F0000000000000
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call float (...)* bitcast (float (i64)* @ull2f to float (...)*)(i64 9223372036854775807)
  %cmp6 = fcmp une float %call5, 0x43E0000000000000
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call float (...)* bitcast (float (i64)* @ull2f to float (...)*)(i64 -9223372036854775808)
  %cmp10 = fcmp une float %call9, 0x43E0000000000000
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call double (...)* bitcast (double (i64)* @ull2d to double (...)*)(i64 0)
  %cmp14 = fcmp une double %call13, 0.000000e+00
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call double (...)* bitcast (double (i64)* @ull2d to double (...)*)(i64 -1)
  %cmp18 = fcmp une double %call17, 0x43F0000000000000
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call double (...)* bitcast (double (i64)* @ull2d to double (...)*)(i64 9223372036854775807)
  %cmp22 = fcmp une double %call21, 0x43E0000000000000
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call double (...)* bitcast (double (i64)* @ull2d to double (...)*)(i64 -9223372036854775808)
  %cmp26 = fcmp une double %call25, 0x43E0000000000000
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @ull2ld to x86_fp80 (...)*)(i64 0)
  %cmp30 = fcmp une x86_fp80 %call29, 0xK00000000000000000000
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @ull2ld to x86_fp80 (...)*)(i64 -1)
  %cmp34 = fcmp une x86_fp80 %call33, 0xK403EFFFFFFFFFFFFFFFF
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @ull2ld to x86_fp80 (...)*)(i64 9223372036854775807)
  %cmp38 = fcmp une x86_fp80 %call37, 0xK403DFFFFFFFFFFFFFFFE
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @ull2ld to x86_fp80 (...)*)(i64 -9223372036854775808)
  %cmp42 = fcmp une x86_fp80 %call41, 0xK403E8000000000000000
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call float (...)* bitcast (float (i64)* @sll2f to float (...)*)(i64 0)
  %cmp46 = fcmp une float %call45, 0.000000e+00
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call float (...)* bitcast (float (i64)* @sll2f to float (...)*)(i64 -1)
  %cmp50 = fcmp une float %call49, -1.000000e+00
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call float (...)* bitcast (float (i64)* @sll2f to float (...)*)(i64 9223372036854775807)
  %call54 = call i32 @fnear(float %call53, float 0x43E0000000000000)
  %tobool = icmp ne i32 %call54, 0
  br i1 %tobool, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call float (...)* bitcast (float (i64)* @sll2f to float (...)*)(i64 -9223372036854775808)
  %cmp58 = fcmp une float %call57, 0xC3E0000000000000
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call double (...)* bitcast (double (i64)* @sll2d to double (...)*)(i64 0)
  %cmp62 = fcmp une double %call61, 0.000000e+00
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call double (...)* bitcast (double (i64)* @sll2d to double (...)*)(i64 -1)
  %cmp66 = fcmp une double %call65, -1.000000e+00
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call double (...)* bitcast (double (i64)* @sll2d to double (...)*)(i64 9223372036854775807)
  %call70 = call i32 @dnear(double %call69, double 0x43E0000000000000)
  %tobool71 = icmp ne i32 %call70, 0
  br i1 %tobool71, label %if.end73, label %if.then72

if.then72:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end73:                                         ; preds = %if.end68
  %call74 = call double (...)* bitcast (double (i64)* @sll2d to double (...)*)(i64 -9223372036854775808)
  %call75 = call i32 @dnear(double %call74, double 0xC3E0000000000000)
  %tobool76 = icmp ne i32 %call75, 0
  br i1 %tobool76, label %if.end78, label %if.then77

if.then77:                                        ; preds = %if.end73
  call void @abort() noreturn nounwind
  unreachable

if.end78:                                         ; preds = %if.end73
  %call79 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @sll2ld to x86_fp80 (...)*)(i64 0)
  %cmp80 = fcmp une x86_fp80 %call79, 0xK00000000000000000000
  br i1 %cmp80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end78
  call void @abort() noreturn nounwind
  unreachable

if.end82:                                         ; preds = %if.end78
  %call83 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @sll2ld to x86_fp80 (...)*)(i64 -1)
  %cmp84 = fcmp une x86_fp80 %call83, 0xKBFFF8000000000000000
  br i1 %cmp84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end82
  call void @abort() noreturn nounwind
  unreachable

if.end86:                                         ; preds = %if.end82
  %call87 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @sll2ld to x86_fp80 (...)*)(i64 9223372036854775807)
  %call88 = call i32 @ldnear(x86_fp80 %call87, x86_fp80 0xK403DFFFFFFFFFFFFFFFE)
  %tobool89 = icmp ne i32 %call88, 0
  br i1 %tobool89, label %if.end91, label %if.then90

if.then90:                                        ; preds = %if.end86
  call void @abort() noreturn nounwind
  unreachable

if.end91:                                         ; preds = %if.end86
  %call92 = call x86_fp80 (...)* bitcast (x86_fp80 (i64)* @sll2ld to x86_fp80 (...)*)(i64 -9223372036854775808)
  %call93 = call i32 @ldnear(x86_fp80 %call92, x86_fp80 0xKC03E8000000000000000)
  %tobool94 = icmp ne i32 %call93, 0
  br i1 %tobool94, label %if.end96, label %if.then95

if.then95:                                        ; preds = %if.end91
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end91
  ret void
}

define i32 @f2u(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptoui float %tmp to i32
  ret i32 %conv
}

define i32 @d2u(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptoui double %tmp to i32
  ret i32 %conv
}

define i32 @ld2u(x86_fp80 %d) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  %tmp = load x86_fp80* %d.addr, align 16
  %conv = fptoui x86_fp80 %tmp to i32
  ret i32 %conv
}

define i32 @f2s(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptosi float %tmp to i32
  ret i32 %conv
}

define i32 @d2s(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptosi double %tmp to i32
  ret i32 %conv
}

define i32 @ld2s(x86_fp80 %d) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  %tmp = load x86_fp80* %d.addr, align 16
  %conv = fptosi x86_fp80 %tmp to i32
  ret i32 %conv
}

define void @test_float_to_integer() nounwind uwtable {
entry:
  %call = call i32 @f2u(float 0.000000e+00)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @f2u(float 0x3FEFF7CEE0000000)
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @f2u(float 1.000000e+00)
  %cmp6 = icmp ne i32 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @f2u(float 0x3FFFD70A40000000)
  %cmp10 = icmp ne i32 %call9, 1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @f2u(float 0x41E0000000000000)
  %cmp14 = icmp ne i32 %call13, 2147483647
  br i1 %cmp14, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %if.end12
  %call15 = call i32 @f2u(float 0x41E0000000000000)
  %cmp16 = icmp ne i32 %call15, -2147483648
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %land.lhs.true, %if.end12
  %call19 = call i32 @f2u(float 0x41E0000000000000)
  %cmp20 = icmp ne i32 %call19, -2147483648
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %call23 = call i32 @d2u(double 0.000000e+00)
  %cmp24 = icmp ne i32 %call23, 0
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end22
  %call27 = call i32 @d2u(double 9.990000e-01)
  %cmp28 = icmp ne i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end26
  %call31 = call i32 @d2u(double 1.000000e+00)
  %cmp32 = icmp ne i32 %call31, 1
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
  %call35 = call i32 @d2u(double 1.990000e+00)
  %cmp36 = icmp ne i32 %call35, 1
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end34
  call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.end34
  %call39 = call i32 @d2u(double 0x41EFFFFFFFE00000)
  %cmp40 = icmp ne i32 %call39, -1
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end38
  call void @abort() noreturn nounwind
  unreachable

if.end42:                                         ; preds = %if.end38
  %call43 = call i32 @d2u(double 0x41DFFFFFFFC00000)
  %cmp44 = icmp ne i32 %call43, 2147483647
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end42
  call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.end42
  %call47 = call i32 @d2u(double 0x41E0000000000000)
  %cmp48 = icmp ne i32 %call47, -2147483648
  br i1 %cmp48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end46
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.end46
  %call51 = call i32 @ld2u(x86_fp80 0xK00000000000000000000)
  %cmp52 = icmp ne i32 %call51, 0
  br i1 %cmp52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end50
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %if.end50
  %call55 = call i32 @ld2u(x86_fp80 0xK3FFEFFBE76C8B4395800)
  %cmp56 = icmp ne i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end54
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end54
  %call59 = call i32 @ld2u(x86_fp80 0xK3FFF8000000000000000)
  %cmp60 = icmp ne i32 %call59, 1
  br i1 %cmp60, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end58
  %call63 = call i32 @ld2u(x86_fp80 0xK3FFFFEB851EB851EB800)
  %cmp64 = icmp ne i32 %call63, 1
  br i1 %cmp64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end62
  call void @abort() noreturn nounwind
  unreachable

if.end66:                                         ; preds = %if.end62
  %call67 = call i32 @ld2u(x86_fp80 0xK401EFFFFFFFF00000000)
  %cmp68 = icmp ne i32 %call67, -1
  br i1 %cmp68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end66
  call void @abort() noreturn nounwind
  unreachable

if.end70:                                         ; preds = %if.end66
  %call71 = call i32 @ld2u(x86_fp80 0xK401DFFFFFFFE00000000)
  %cmp72 = icmp ne i32 %call71, 2147483647
  br i1 %cmp72, label %if.then73, label %if.end74

if.then73:                                        ; preds = %if.end70
  call void @abort() noreturn nounwind
  unreachable

if.end74:                                         ; preds = %if.end70
  %call75 = call i32 @ld2u(x86_fp80 0xK401E8000000000000000)
  %cmp76 = icmp ne i32 %call75, -2147483648
  br i1 %cmp76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end74
  call void @abort() noreturn nounwind
  unreachable

if.end78:                                         ; preds = %if.end74
  %call79 = call i32 @f2s(float 0.000000e+00)
  %cmp80 = icmp ne i32 %call79, 0
  br i1 %cmp80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end78
  call void @abort() noreturn nounwind
  unreachable

if.end82:                                         ; preds = %if.end78
  %call83 = call i32 @f2s(float 0x3FEFF7CEE0000000)
  %cmp84 = icmp ne i32 %call83, 0
  br i1 %cmp84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end82
  call void @abort() noreturn nounwind
  unreachable

if.end86:                                         ; preds = %if.end82
  %call87 = call i32 @f2s(float 1.000000e+00)
  %cmp88 = icmp ne i32 %call87, 1
  br i1 %cmp88, label %if.then89, label %if.end90

if.then89:                                        ; preds = %if.end86
  call void @abort() noreturn nounwind
  unreachable

if.end90:                                         ; preds = %if.end86
  %call91 = call i32 @f2s(float 0x3FFFD70A40000000)
  %cmp92 = icmp ne i32 %call91, 1
  br i1 %cmp92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end90
  call void @abort() noreturn nounwind
  unreachable

if.end94:                                         ; preds = %if.end90
  %call95 = call i32 @f2s(float 0xBFEFF7CEE0000000)
  %cmp96 = icmp ne i32 %call95, 0
  br i1 %cmp96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end94
  call void @abort() noreturn nounwind
  unreachable

if.end98:                                         ; preds = %if.end94
  %call99 = call i32 @f2s(float -1.000000e+00)
  %cmp100 = icmp ne i32 %call99, -1
  br i1 %cmp100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end98
  call void @abort() noreturn nounwind
  unreachable

if.end102:                                        ; preds = %if.end98
  %call103 = call i32 @f2s(float 0xBFFFD70A40000000)
  %cmp104 = icmp ne i32 %call103, -1
  br i1 %cmp104, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.end102
  call void @abort() noreturn nounwind
  unreachable

if.end106:                                        ; preds = %if.end102
  %call107 = call i32 @f2s(float 0xC1E0000000000000)
  %cmp108 = icmp ne i32 %call107, -2147483648
  br i1 %cmp108, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end106
  call void @abort() noreturn nounwind
  unreachable

if.end110:                                        ; preds = %if.end106
  %call111 = call i32 @d2s(double 0.000000e+00)
  %cmp112 = icmp ne i32 %call111, 0
  br i1 %cmp112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %if.end110
  call void @abort() noreturn nounwind
  unreachable

if.end114:                                        ; preds = %if.end110
  %call115 = call i32 @d2s(double 9.990000e-01)
  %cmp116 = icmp ne i32 %call115, 0
  br i1 %cmp116, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end114
  call void @abort() noreturn nounwind
  unreachable

if.end118:                                        ; preds = %if.end114
  %call119 = call i32 @d2s(double 1.000000e+00)
  %cmp120 = icmp ne i32 %call119, 1
  br i1 %cmp120, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end118
  call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %if.end118
  %call123 = call i32 @d2s(double 1.990000e+00)
  %cmp124 = icmp ne i32 %call123, 1
  br i1 %cmp124, label %if.then125, label %if.end126

if.then125:                                       ; preds = %if.end122
  call void @abort() noreturn nounwind
  unreachable

if.end126:                                        ; preds = %if.end122
  %call127 = call i32 @d2s(double -9.990000e-01)
  %cmp128 = icmp ne i32 %call127, 0
  br i1 %cmp128, label %if.then129, label %if.end130

if.then129:                                       ; preds = %if.end126
  call void @abort() noreturn nounwind
  unreachable

if.end130:                                        ; preds = %if.end126
  %call131 = call i32 @d2s(double -1.000000e+00)
  %cmp132 = icmp ne i32 %call131, -1
  br i1 %cmp132, label %if.then133, label %if.end134

if.then133:                                       ; preds = %if.end130
  call void @abort() noreturn nounwind
  unreachable

if.end134:                                        ; preds = %if.end130
  %call135 = call i32 @d2s(double -1.990000e+00)
  %cmp136 = icmp ne i32 %call135, -1
  br i1 %cmp136, label %if.then137, label %if.end138

if.then137:                                       ; preds = %if.end134
  call void @abort() noreturn nounwind
  unreachable

if.end138:                                        ; preds = %if.end134
  %call139 = call i32 @d2s(double 0x41DFFFFFFFC00000)
  %cmp140 = icmp ne i32 %call139, 2147483647
  br i1 %cmp140, label %if.then141, label %if.end142

if.then141:                                       ; preds = %if.end138
  call void @abort() noreturn nounwind
  unreachable

if.end142:                                        ; preds = %if.end138
  %call143 = call i32 @d2s(double 0xC1E0000000000000)
  %cmp144 = icmp ne i32 %call143, -2147483648
  br i1 %cmp144, label %if.then145, label %if.end146

if.then145:                                       ; preds = %if.end142
  call void @abort() noreturn nounwind
  unreachable

if.end146:                                        ; preds = %if.end142
  %call147 = call i32 @ld2s(x86_fp80 0xK00000000000000000000)
  %cmp148 = icmp ne i32 %call147, 0
  br i1 %cmp148, label %if.then149, label %if.end150

if.then149:                                       ; preds = %if.end146
  call void @abort() noreturn nounwind
  unreachable

if.end150:                                        ; preds = %if.end146
  %call151 = call i32 @ld2s(x86_fp80 0xK3FFEFFBE76C8B4395800)
  %cmp152 = icmp ne i32 %call151, 0
  br i1 %cmp152, label %if.then153, label %if.end154

if.then153:                                       ; preds = %if.end150
  call void @abort() noreturn nounwind
  unreachable

if.end154:                                        ; preds = %if.end150
  %call155 = call i32 @ld2s(x86_fp80 0xK3FFF8000000000000000)
  %cmp156 = icmp ne i32 %call155, 1
  br i1 %cmp156, label %if.then157, label %if.end158

if.then157:                                       ; preds = %if.end154
  call void @abort() noreturn nounwind
  unreachable

if.end158:                                        ; preds = %if.end154
  %call159 = call i32 @ld2s(x86_fp80 0xK3FFFFEB851EB851EB800)
  %cmp160 = icmp ne i32 %call159, 1
  br i1 %cmp160, label %if.then161, label %if.end162

if.then161:                                       ; preds = %if.end158
  call void @abort() noreturn nounwind
  unreachable

if.end162:                                        ; preds = %if.end158
  %call163 = call i32 @ld2s(x86_fp80 0xKBFFEFFBE76C8B4395800)
  %cmp164 = icmp ne i32 %call163, 0
  br i1 %cmp164, label %if.then165, label %if.end166

if.then165:                                       ; preds = %if.end162
  call void @abort() noreturn nounwind
  unreachable

if.end166:                                        ; preds = %if.end162
  %call167 = call i32 @ld2s(x86_fp80 0xKBFFF8000000000000000)
  %cmp168 = icmp ne i32 %call167, -1
  br i1 %cmp168, label %if.then169, label %if.end170

if.then169:                                       ; preds = %if.end166
  call void @abort() noreturn nounwind
  unreachable

if.end170:                                        ; preds = %if.end166
  %call171 = call i32 @ld2s(x86_fp80 0xKBFFFFEB851EB851EB800)
  %cmp172 = icmp ne i32 %call171, -1
  br i1 %cmp172, label %if.then173, label %if.end174

if.then173:                                       ; preds = %if.end170
  call void @abort() noreturn nounwind
  unreachable

if.end174:                                        ; preds = %if.end170
  %call175 = call i32 @ld2s(x86_fp80 0xK401DFFFFFFFE00000000)
  %cmp176 = icmp ne i32 %call175, 2147483647
  br i1 %cmp176, label %if.then177, label %if.end178

if.then177:                                       ; preds = %if.end174
  call void @abort() noreturn nounwind
  unreachable

if.end178:                                        ; preds = %if.end174
  %call179 = call i32 @ld2s(x86_fp80 0xKC01E8000000000000000)
  %cmp180 = icmp ne i32 %call179, -2147483648
  br i1 %cmp180, label %if.then181, label %if.end182

if.then181:                                       ; preds = %if.end178
  call void @abort() noreturn nounwind
  unreachable

if.end182:                                        ; preds = %if.end178
  ret void
}

define i64 @f2ull(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptoui float %tmp to i64
  ret i64 %conv
}

define i64 @d2ull(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptoui double %tmp to i64
  ret i64 %conv
}

define i64 @ld2ull(x86_fp80 %d) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  %tmp = load x86_fp80* %d.addr, align 16
  %conv = fptoui x86_fp80 %tmp to i64
  ret i64 %conv
}

define i64 @f2sll(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptosi float %tmp to i64
  ret i64 %conv
}

define i64 @d2sll(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptosi double %tmp to i64
  ret i64 %conv
}

define i64 @ld2sll(x86_fp80 %d) nounwind uwtable {
entry:
  %d.addr = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %d.addr, align 16
  %tmp = load x86_fp80* %d.addr, align 16
  %conv = fptosi x86_fp80 %tmp to i64
  ret i64 %conv
}

define void @test_float_to_longlong_integer() nounwind uwtable {
entry:
  %call = call i64 @f2ull(float 0.000000e+00)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @f2ull(float 0x3FEFF7CEE0000000)
  %cmp2 = icmp ne i64 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i64 @f2ull(float 1.000000e+00)
  %cmp6 = icmp ne i64 %call5, 1
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 @f2ull(float 0x3FFFD70A40000000)
  %cmp10 = icmp ne i64 %call9, 1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @f2ull(float 0x43E0000000000000)
  %cmp14 = icmp ne i64 %call13, 9223372036854775807
  br i1 %cmp14, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %if.end12
  %call15 = call i64 @f2ull(float 0x43E0000000000000)
  %cmp16 = icmp ne i64 %call15, -9223372036854775808
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %land.lhs.true
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %land.lhs.true, %if.end12
  %call19 = call i64 @f2ull(float 0x43E0000000000000)
  %cmp20 = icmp ne i64 %call19, -9223372036854775808
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end18
  %call23 = call i64 @d2ull(double 0.000000e+00)
  %cmp24 = icmp ne i64 %call23, 0
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end22
  %call27 = call i64 @d2ull(double 9.990000e-01)
  %cmp28 = icmp ne i64 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end26
  %call31 = call i64 @d2ull(double 1.000000e+00)
  %cmp32 = icmp ne i64 %call31, 1
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
  %call35 = call i64 @d2ull(double 1.990000e+00)
  %cmp36 = icmp ne i64 %call35, 1
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end34
  call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.end34
  %call39 = call i64 @d2ull(double 0x43E0000000000000)
  %cmp40 = icmp ne i64 %call39, 9223372036854775807
  br i1 %cmp40, label %land.lhs.true41, label %if.end45

land.lhs.true41:                                  ; preds = %if.end38
  %call42 = call i64 @d2ull(double 0x43E0000000000000)
  %cmp43 = icmp ne i64 %call42, -9223372036854775808
  br i1 %cmp43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %land.lhs.true41
  call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %land.lhs.true41, %if.end38
  %call46 = call i64 @d2ull(double 0x43E0000000000000)
  %cmp47 = icmp ne i64 %call46, -9223372036854775808
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end45
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end45
  %call50 = call i64 @ld2ull(x86_fp80 0xK00000000000000000000)
  %cmp51 = icmp ne i64 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  %call54 = call i64 @ld2ull(x86_fp80 0xK3FFEFFBE76C8B4395800)
  %cmp55 = icmp ne i64 %call54, 0
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end57:                                         ; preds = %if.end53
  %call58 = call i64 @ld2ull(x86_fp80 0xK3FFF8000000000000000)
  %cmp59 = icmp ne i64 %call58, 1
  br i1 %cmp59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end57
  call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %if.end57
  %call62 = call i64 @ld2ull(x86_fp80 0xK3FFFFEB851EB851EB800)
  %cmp63 = icmp ne i64 %call62, 1
  br i1 %cmp63, label %if.then64, label %if.end65

if.then64:                                        ; preds = %if.end61
  call void @abort() noreturn nounwind
  unreachable

if.end65:                                         ; preds = %if.end61
  %call66 = call i64 @ld2ull(x86_fp80 0xK403DFFFFFFFFFFFFFFFE)
  %cmp67 = icmp ne i64 %call66, 9223372036854775807
  br i1 %cmp67, label %land.lhs.true68, label %if.end72

land.lhs.true68:                                  ; preds = %if.end65
  %call69 = call i64 @ld2ull(x86_fp80 0xK403DFFFFFFFFFFFFFFFE)
  %cmp70 = icmp ne i64 %call69, -9223372036854775808
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %land.lhs.true68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %land.lhs.true68, %if.end65
  %call73 = call i64 @ld2ull(x86_fp80 0xK403E8000000000000000)
  %cmp74 = icmp ne i64 %call73, -9223372036854775808
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i64 @f2sll(float 0.000000e+00)
  %cmp78 = icmp ne i64 %call77, 0
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i64 @f2sll(float 0x3FEFF7CEE0000000)
  %cmp82 = icmp ne i64 %call81, 0
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i64 @f2sll(float 1.000000e+00)
  %cmp86 = icmp ne i64 %call85, 1
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i64 @f2sll(float 0x3FFFD70A40000000)
  %cmp90 = icmp ne i64 %call89, 1
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  %call93 = call i64 @f2sll(float 0xBFEFF7CEE0000000)
  %cmp94 = icmp ne i64 %call93, 0
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end92
  %call97 = call i64 @f2sll(float -1.000000e+00)
  %cmp98 = icmp ne i64 %call97, -1
  br i1 %cmp98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end100:                                        ; preds = %if.end96
  %call101 = call i64 @f2sll(float 0xBFFFD70A40000000)
  %cmp102 = icmp ne i64 %call101, -1
  br i1 %cmp102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end100
  %call105 = call i64 @f2sll(float 0xC3E0000000000000)
  %cmp106 = icmp ne i64 %call105, -9223372036854775808
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end108:                                        ; preds = %if.end104
  %call109 = call i64 @d2sll(double 0.000000e+00)
  %cmp110 = icmp ne i64 %call109, 0
  br i1 %cmp110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn nounwind
  unreachable

if.end112:                                        ; preds = %if.end108
  %call113 = call i64 @d2sll(double 9.990000e-01)
  %cmp114 = icmp ne i64 %call113, 0
  br i1 %cmp114, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn nounwind
  unreachable

if.end116:                                        ; preds = %if.end112
  %call117 = call i64 @d2sll(double 1.000000e+00)
  %cmp118 = icmp ne i64 %call117, 1
  br i1 %cmp118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn nounwind
  unreachable

if.end120:                                        ; preds = %if.end116
  %call121 = call i64 @d2sll(double 1.990000e+00)
  %cmp122 = icmp ne i64 %call121, 1
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end120
  %call125 = call i64 @d2sll(double -9.990000e-01)
  %cmp126 = icmp ne i64 %call125, 0
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end124
  %call129 = call i64 @d2sll(double -1.000000e+00)
  %cmp130 = icmp ne i64 %call129, -1
  br i1 %cmp130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end132:                                        ; preds = %if.end128
  %call133 = call i64 @d2sll(double -1.990000e+00)
  %cmp134 = icmp ne i64 %call133, -1
  br i1 %cmp134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end132
  call void @abort() noreturn nounwind
  unreachable

if.end136:                                        ; preds = %if.end132
  %call137 = call i64 @d2sll(double 0xC3E0000000000000)
  %cmp138 = icmp ne i64 %call137, -9223372036854775808
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end136
  call void @abort() noreturn nounwind
  unreachable

if.end140:                                        ; preds = %if.end136
  %call141 = call i64 @ld2sll(x86_fp80 0xK00000000000000000000)
  %cmp142 = icmp ne i64 %call141, 0
  br i1 %cmp142, label %if.then143, label %if.end144

if.then143:                                       ; preds = %if.end140
  call void @abort() noreturn nounwind
  unreachable

if.end144:                                        ; preds = %if.end140
  %call145 = call i64 @ld2sll(x86_fp80 0xK3FFEFFBE76C8B4395800)
  %cmp146 = icmp ne i64 %call145, 0
  br i1 %cmp146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %if.end144
  call void @abort() noreturn nounwind
  unreachable

if.end148:                                        ; preds = %if.end144
  %call149 = call i64 @ld2sll(x86_fp80 0xK3FFF8000000000000000)
  %cmp150 = icmp ne i64 %call149, 1
  br i1 %cmp150, label %if.then151, label %if.end152

if.then151:                                       ; preds = %if.end148
  call void @abort() noreturn nounwind
  unreachable

if.end152:                                        ; preds = %if.end148
  %call153 = call i64 @ld2sll(x86_fp80 0xK3FFFFEB851EB851EB800)
  %cmp154 = icmp ne i64 %call153, 1
  br i1 %cmp154, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end152
  call void @abort() noreturn nounwind
  unreachable

if.end156:                                        ; preds = %if.end152
  %call157 = call i64 @ld2sll(x86_fp80 0xKBFFEFFBE76C8B4395800)
  %cmp158 = icmp ne i64 %call157, 0
  br i1 %cmp158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end156
  call void @abort() noreturn nounwind
  unreachable

if.end160:                                        ; preds = %if.end156
  %call161 = call i64 @ld2sll(x86_fp80 0xKBFFF8000000000000000)
  %cmp162 = icmp ne i64 %call161, -1
  br i1 %cmp162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end160
  call void @abort() noreturn nounwind
  unreachable

if.end164:                                        ; preds = %if.end160
  %call165 = call i64 @ld2sll(x86_fp80 0xKBFFFFEB851EB851EB800)
  %cmp166 = icmp ne i64 %call165, -1
  br i1 %cmp166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.end164
  call void @abort() noreturn nounwind
  unreachable

if.end168:                                        ; preds = %if.end164
  %call169 = call i64 @ld2sll(x86_fp80 0xKC03E8000000000000000)
  %cmp170 = icmp ne i64 %call169, -9223372036854775808
  br i1 %cmp170, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end168
  call void @abort() noreturn nounwind
  unreachable

if.end172:                                        ; preds = %if.end168
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test_integer_to_float()
  call void @test_float_to_integer()
  call void @test_longlong_integer_to_float()
  call void @test_float_to_longlong_integer()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
