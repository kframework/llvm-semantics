; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44942.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @test1(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, ...) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store x86_fp80 %h, x86_fp80* %h.addr, align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %i, align 4
  %1 = load i32* %i, align 4
  %cmp = icmp ne i32 %1, 1234
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define void @test2(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, x86_fp80 %h, i32 %i, x86_fp80 %j, i32 %k, x86_fp80 %l, i32 %m, x86_fp80 %n, ...) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca x86_fp80, align 16
  %i.addr = alloca i32, align 4
  %j.addr = alloca x86_fp80, align 16
  %k.addr = alloca i32, align 4
  %l.addr = alloca x86_fp80, align 16
  %m.addr = alloca i32, align 4
  %n.addr = alloca x86_fp80, align 16
  %o = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store x86_fp80 %h, x86_fp80* %h.addr, align 16
  store i32 %i, i32* %i.addr, align 4
  store x86_fp80 %j, x86_fp80* %j.addr, align 16
  store i32 %k, i32* %k.addr, align 4
  store x86_fp80 %l, x86_fp80* %l.addr, align 16
  store i32 %m, i32* %m.addr, align 4
  store x86_fp80 %n, x86_fp80* %n.addr, align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %o, align 4
  %1 = load i32* %o, align 4
  %cmp = icmp ne i32 %1, 1234
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @test3(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, ...) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  %c.addr = alloca double, align 8
  %d.addr = alloca double, align 8
  %e.addr = alloca double, align 8
  %f.addr = alloca double, align 8
  %g.addr = alloca double, align 8
  %h.addr = alloca x86_fp80, align 16
  %i = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  store double %c, double* %c.addr, align 8
  store double %d, double* %d.addr, align 8
  store double %e, double* %e.addr, align 8
  store double %f, double* %f.addr, align 8
  store double %g, double* %g.addr, align 8
  store x86_fp80 %h, x86_fp80* %h.addr, align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %0, double* %i, align 8
  %1 = load double* %i, align 8
  %cmp = fcmp une double %1, 1.234000e+03
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @test4(double %a, double %b, double %c, double %d, double %e, double %f, double %g, x86_fp80 %h, double %i, x86_fp80 %j, double %k, x86_fp80 %l, double %m, x86_fp80 %n, ...) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  %c.addr = alloca double, align 8
  %d.addr = alloca double, align 8
  %e.addr = alloca double, align 8
  %f.addr = alloca double, align 8
  %g.addr = alloca double, align 8
  %h.addr = alloca x86_fp80, align 16
  %i.addr = alloca double, align 8
  %j.addr = alloca x86_fp80, align 16
  %k.addr = alloca double, align 8
  %l.addr = alloca x86_fp80, align 16
  %m.addr = alloca double, align 8
  %n.addr = alloca x86_fp80, align 16
  %o = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  store double %c, double* %c.addr, align 8
  store double %d, double* %d.addr, align 8
  store double %e, double* %e.addr, align 8
  store double %f, double* %f.addr, align 8
  store double %g, double* %g.addr, align 8
  store x86_fp80 %h, x86_fp80* %h.addr, align 16
  store double %i, double* %i.addr, align 8
  store x86_fp80 %j, x86_fp80* %j.addr, align 16
  store double %k, double* %k.addr, align 8
  store x86_fp80 %l, x86_fp80* %l.addr, align 16
  store double %m, double* %m.addr, align 8
  store x86_fp80 %n, x86_fp80* %n.addr, align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, double
  store double %0, double* %o, align 8
  %1 = load double* %o, align 8
  %cmp = fcmp une double %1, 1.234000e+03
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, ...)* @test1(i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, x86_fp80 0xK00000000000000000000, i32 1234)
  call void (i32, i32, i32, i32, i32, i32, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, i32, x86_fp80, ...)* @test2(i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 0, x86_fp80 0xK00000000000000000000, i32 1234)
  call void (double, double, double, double, double, double, double, x86_fp80, ...)* @test3(double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 1.234000e+03)
  call void (double, double, double, double, double, double, double, x86_fp80, double, x86_fp80, double, x86_fp80, double, x86_fp80, ...)* @test4(double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 0.000000e+00, x86_fp80 0xK00000000000000000000, double 1.234000e+03)
  ret i32 0
}
