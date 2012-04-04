; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/stdarg-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.A = type { i32, [1 x %struct.__va_list_tag], [2 x [1 x %struct.__va_list_tag]] }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@bar_arg = common global i32 0, align 4
@x = common global i64 0, align 8
@d = common global double 0.000000e+00, align 8

define void @foo(i32 %v, %struct.__va_list_tag* %ap) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  %ap.addr = alloca %struct.__va_list_tag*, align 8
  store i32 %v, i32* %v.addr, align 4
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %ap.addr, align 8
  %0 = load i32* %v.addr, align 4
  switch i32 %0, label %sw.default [
    i32 5, label %sw.bb
    i32 8, label %sw.bb5
    i32 11, label %sw.bb10
  ]

sw.bb:                                            ; preds = %entry
  %1 = load %struct.__va_list_tag** %ap.addr, align 8
  %2 = va_arg %struct.__va_list_tag* %1, i32
  store i32 %2, i32* @foo_arg, align 4
  %3 = load %struct.__va_list_tag** %ap.addr, align 8
  %4 = va_arg %struct.__va_list_tag* %3, double
  %5 = load i32* @foo_arg, align 4
  %conv = sitofp i32 %5 to double
  %add = fadd double %conv, %4
  %conv1 = fptosi double %add to i32
  store i32 %conv1, i32* @foo_arg, align 4
  %6 = load %struct.__va_list_tag** %ap.addr, align 8
  %7 = va_arg %struct.__va_list_tag* %6, i64
  %8 = load i32* @foo_arg, align 4
  %conv2 = sext i32 %8 to i64
  %add3 = add nsw i64 %conv2, %7
  %conv4 = trunc i64 %add3 to i32
  store i32 %conv4, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %9 = load %struct.__va_list_tag** %ap.addr, align 8
  %10 = va_arg %struct.__va_list_tag* %9, i64
  %conv6 = trunc i64 %10 to i32
  store i32 %conv6, i32* @foo_arg, align 4
  %11 = load %struct.__va_list_tag** %ap.addr, align 8
  %12 = va_arg %struct.__va_list_tag* %11, double
  %13 = load i32* @foo_arg, align 4
  %conv7 = sitofp i32 %13 to double
  %add8 = fadd double %conv7, %12
  %conv9 = fptosi double %add8 to i32
  store i32 %conv9, i32* @foo_arg, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %14 = load %struct.__va_list_tag** %ap.addr, align 8
  %15 = va_arg %struct.__va_list_tag* %14, i32
  store i32 %15, i32* @foo_arg, align 4
  %16 = load %struct.__va_list_tag** %ap.addr, align 8
  %17 = va_arg %struct.__va_list_tag* %16, x86_fp80
  %18 = load i32* @foo_arg, align 4
  %conv11 = sitofp i32 %18 to x86_fp80
  %add12 = fadd x86_fp80 %conv11, %17
  %conv13 = fptosi x86_fp80 %add12 to i32
  store i32 %conv13, i32* @foo_arg, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb10, %sw.bb5, %sw.bb
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %v.addr = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32* %v.addr, align 4
  %cmp = icmp eq i32 %0, 16386
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0), i32
  %cmp1 = icmp ne i32 %1, 13
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %2 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0), double
  %cmp2 = fcmp une double %2, -1.400000e+01
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %lor.lhs.false, %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  %3 = load i32* %v.addr, align 4
  store i32 %3, i32* @bar_arg, align 4
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i32 0, i32 0), i64
  store i64 %0, i64* @x, align 8
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  store i64 %0, i64* @x, align 8
  %arrayidx4 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  store i32 %i, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  %arrayidx2 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx2, i32 0, i32 0
  call void @foo(i32 %0, %struct.__va_list_tag* %arraydecay3)
  %arrayidx4 = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i32 0, i64 4
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay3, i64
  store i64 %0, i64* @x, align 8
  %g4 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  %arraydecay34 = bitcast %struct.__va_list_tag* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %g = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %g, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  %g2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g2, i32 0, i32 0
  call void @foo(i32 %0, %struct.__va_list_tag* %arraydecay3)
  %g4 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arraydecay5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %g4, i32 0, i32 0
  %arraydecay56 = bitcast %struct.__va_list_tag* %arraydecay5 to i8*
  call void @llvm.va_end(i8* %arraydecay56)
  ret void
}

define void @f10(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay4, i64
  store i64 %0, i64* @x, align 8
  %h5 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx6 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h5, i32 0, i64 1
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx6, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  ret void
}

define void @f11(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  call void @bar(i32 %0)
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  %arraydecay45 = bitcast %struct.__va_list_tag* %arraydecay4 to i8*
  call void @llvm.va_end(i8* %arraydecay45)
  ret void
}

define void @f12(i32 %i, ...) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %a = alloca %struct.A, align 8
  store i32 %i, i32* %i.addr, align 4
  %h = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h, i32 0, i64 1
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i32* %i.addr, align 4
  %h2 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h2, i32 0, i64 1
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx3, i32 0, i32 0
  call void @foo(i32 %0, %struct.__va_list_tag* %arraydecay4)
  %h5 = getelementptr inbounds %struct.A* %a, i32 0, i32 2
  %arrayidx6 = getelementptr inbounds [2 x [1 x %struct.__va_list_tag]]* %h5, i32 0, i64 1
  %arraydecay7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %arrayidx6, i32 0, i32 0
  %arraydecay78 = bitcast %struct.__va_list_tag* %arraydecay7 to i8*
  call void @llvm.va_end(i8* %arraydecay78)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @f1(i32 1, i64 79)
  %0 = load i64* @x, align 8
  %cmp = icmp ne i64 %0, 79
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void (i32, ...)* @f2(i32 16386, i32 13, double -1.400000e+01)
  %1 = load i32* @bar_arg, align 4
  %cmp1 = icmp ne i32 %1, 16386
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  call void (i32, ...)* @f3(i32 3, i64 2031)
  %2 = load i64* @x, align 8
  %cmp4 = icmp ne i64 %2, 2031
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  call void (i32, ...)* @f4(i32 4, i32 18)
  %3 = load i32* @bar_arg, align 4
  %cmp7 = icmp ne i32 %3, 4
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  call void (i32, ...)* @f5(i32 5, i32 1, double 1.900000e+01, i64 18)
  %4 = load i32* @foo_arg, align 4
  %cmp10 = icmp ne i32 %4, 38
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  call void (i32, ...)* @f6(i32 6, i64 18)
  %5 = load i64* @x, align 8
  %cmp13 = icmp ne i64 %5, 18
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  call void (i32, ...)* @f7(i32 7)
  %6 = load i32* @bar_arg, align 4
  %cmp16 = icmp ne i32 %6, 7
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  call void (i32, ...)* @f8(i32 8, i64 2031, double 1.300000e+01)
  %7 = load i32* @foo_arg, align 4
  %cmp19 = icmp ne i32 %7, 2044
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end18
  call void (i32, ...)* @f10(i32 9, i64 180)
  %8 = load i64* @x, align 8
  %cmp22 = icmp ne i64 %8, 180
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end21
  call void (i32, ...)* @f11(i32 10)
  %9 = load i32* @bar_arg, align 4
  %cmp25 = icmp ne i32 %9, 10
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end24
  call void (i32, ...)* @f12(i32 11, i32 2030, x86_fp80 0xK4002C000000000000000)
  %10 = load i32* @foo_arg, align 4
  %cmp28 = icmp ne i32 %10, 2042
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end27
  ret i32 0
}
