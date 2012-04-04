; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/stdarg-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@foo_arg = common global i32 0, align 4
@gap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@pap = common global [1 x %struct.__va_list_tag]* null, align 8
@bar_arg = common global i32 0, align 4
@d = common global double 0.000000e+00, align 8
@x = common global i64 0, align 8

define void @foo(i32 %v, %struct.__va_list_tag* nocapture %ap) nounwind uwtable {
entry:
  %cond = icmp eq i32 %v, 5
  br i1 %cond, label %sw.bb, label %sw.default

sw.bb:                                            ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %ap, i32
  store i32 %0, i32* @foo_arg, align 4, !tbaa !0
  ret void

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  switch i32 %v, label %if.end16 [
    i32 16390, label %if.then
    i32 16392, label %if.then5
  ]

if.then:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1 = fcmp une double %0, 1.700000e+01
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2 = icmp eq i64 %1, 129
  br i1 %cmp2, label %if.end16, label %if.then3

if.then3:                                         ; preds = %lor.lhs.false, %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.then5:                                         ; preds = %entry
  %2 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp6 = icmp eq i64 %3, 14
  br i1 %cmp6, label %lor.lhs.false7, label %if.then13

lor.lhs.false7:                                   ; preds = %if.then5
  %4 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %4, i64 0, i64 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay8, x86_fp80
  %cmp9 = fcmp une x86_fp80 %5, 0xK40068300000000000000
  br i1 %cmp9, label %if.then13, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false7
  %6 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i64 0, i64 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay11, i32
  %cmp12 = icmp eq i32 %7, 17
  br i1 %cmp12, label %if.end16, label %if.then13

if.then13:                                        ; preds = %lor.lhs.false10, %if.then5, %lor.lhs.false7
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %entry, %lor.lhs.false, %lor.lhs.false10
  store i32 %v, i32* @bar_arg, align 4, !tbaa !0
  ret void
}

define void @f0(i32 %i, ...) nounwind uwtable readnone {
entry:
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load double* @d, align 8, !tbaa !4
  %conv = fptosi double %0 to i32
  switch i32 %conv, label %bar.exit [
    i32 16390, label %if.then.i
    i32 16392, label %if.then5.i
  ]

if.then.i:                                        ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i = fcmp une double %1, 1.700000e+01
  br i1 %cmp1.i, label %if.then3.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %2 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i = icmp eq i64 %2, 129
  br i1 %cmp2.i, label %bar.exit, label %if.then3.i

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

if.then5.i:                                       ; preds = %entry
  %3 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay.i, i64
  %cmp6.i = icmp eq i64 %4, 14
  br i1 %cmp6.i, label %lor.lhs.false7.i, label %if.then13.i

lor.lhs.false7.i:                                 ; preds = %if.then5.i
  %5 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay8.i, x86_fp80
  %cmp9.i = fcmp une x86_fp80 %6, 0xK40068300000000000000
  br i1 %cmp9.i, label %if.then13.i, label %lor.lhs.false10.i

lor.lhs.false10.i:                                ; preds = %lor.lhs.false7.i
  %7 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %7, i64 0, i64 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay11.i, i32
  %cmp12.i = icmp eq i32 %8, 17
  br i1 %cmp12.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false10.i, %lor.lhs.false7.i, %if.then5.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i, %lor.lhs.false10.i
  store i32 %conv, i32* @bar_arg, align 4, !tbaa !0
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i64
  store i64 %9, i64* @x, align 8, !tbaa !5
  %conv3 = trunc i64 %9 to i32
  switch i32 %conv3, label %bar.exit21 [
    i32 16390, label %if.then.i7
    i32 16392, label %if.then5.i13
  ]

if.then.i7:                                       ; preds = %bar.exit
  %10 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i6 = fcmp une double %10, 1.700000e+01
  br i1 %cmp1.i6, label %if.then3.i10, label %lor.lhs.false.i9

lor.lhs.false.i9:                                 ; preds = %if.then.i7
  %11 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i8 = icmp eq i64 %11, 129
  br i1 %cmp2.i8, label %bar.exit21, label %if.then3.i10

if.then3.i10:                                     ; preds = %lor.lhs.false.i9, %if.then.i7
  call void @abort() noreturn nounwind
  unreachable

if.then5.i13:                                     ; preds = %bar.exit
  %12 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay.i11 = getelementptr inbounds [1 x %struct.__va_list_tag]* %12, i64 0, i64 0
  %13 = va_arg %struct.__va_list_tag* %arraydecay.i11, i64
  %cmp6.i12 = icmp eq i64 %13, 14
  br i1 %cmp6.i12, label %lor.lhs.false7.i16, label %if.then13.i20

lor.lhs.false7.i16:                               ; preds = %if.then5.i13
  %14 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8.i14 = getelementptr inbounds [1 x %struct.__va_list_tag]* %14, i64 0, i64 0
  %15 = va_arg %struct.__va_list_tag* %arraydecay8.i14, x86_fp80
  %cmp9.i15 = fcmp une x86_fp80 %15, 0xK40068300000000000000
  br i1 %cmp9.i15, label %if.then13.i20, label %lor.lhs.false10.i19

lor.lhs.false10.i19:                              ; preds = %lor.lhs.false7.i16
  %16 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11.i17 = getelementptr inbounds [1 x %struct.__va_list_tag]* %16, i64 0, i64 0
  %17 = va_arg %struct.__va_list_tag* %arraydecay11.i17, i32
  %cmp12.i18 = icmp eq i32 %17, 17
  br i1 %cmp12.i18, label %bar.exit21, label %if.then13.i20

if.then13.i20:                                    ; preds = %lor.lhs.false10.i19, %lor.lhs.false7.i16, %if.then5.i13
  call void @abort() noreturn nounwind
  unreachable

bar.exit21:                                       ; preds = %bar.exit, %lor.lhs.false.i9, %lor.lhs.false10.i19
  store i32 %conv3, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  store double %0, double* @d, align 8, !tbaa !4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv = fptosi double %0 to i64
  store i64 %conv, i64* @x, align 8, !tbaa !5
  %cond.i = icmp eq i32 %i, 5
  br i1 %cond.i, label %foo.exit, label %sw.default.i

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  store i32 %1, i32* @foo_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  call void @llvm.va_copy(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*), i8* %arraydecay1)
  switch i32 %i, label %bar.exit [
    i32 16390, label %if.then.i
    i32 16392, label %if.then5.i
  ]

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i = fcmp une double %0, 1.700000e+01
  br i1 %cmp1.i, label %if.then3.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i = icmp eq i64 %1, 129
  br i1 %cmp2.i, label %bar.exit, label %if.then3.i

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

if.then5.i:                                       ; preds = %entry
  %2 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  %3 = va_arg %struct.__va_list_tag* %arraydecay.i, i64
  %cmp6.i = icmp eq i64 %3, 14
  br i1 %cmp6.i, label %lor.lhs.false7.i, label %if.then13.i

lor.lhs.false7.i:                                 ; preds = %if.then5.i
  %4 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %4, i64 0, i64 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay8.i, x86_fp80
  %cmp9.i = fcmp une x86_fp80 %5, 0xK40068300000000000000
  br i1 %cmp9.i, label %if.then13.i, label %lor.lhs.false10.i

lor.lhs.false10.i:                                ; preds = %lor.lhs.false7.i
  %6 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %6, i64 0, i64 0
  %7 = va_arg %struct.__va_list_tag* %arraydecay11.i, i32
  %cmp12.i = icmp eq i32 %7, 17
  br i1 %cmp12.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false10.i, %lor.lhs.false7.i, %if.then5.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i, %lor.lhs.false10.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_copy(i8*, i8*) nounwind

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load double* @d, align 8, !tbaa !4
  %conv = fptosi double %0 to i32
  switch i32 %conv, label %bar.exit [
    i32 16390, label %if.then.i
    i32 16392, label %if.then5.i
  ]

if.then.i:                                        ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i = fcmp une double %1, 1.700000e+01
  br i1 %cmp1.i, label %if.then3.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %2 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i = icmp eq i64 %2, 129
  br i1 %cmp2.i, label %bar.exit, label %if.then3.i

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

if.then5.i:                                       ; preds = %entry
  %3 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %4 = va_arg %struct.__va_list_tag* %arraydecay.i, i64
  %cmp6.i = icmp eq i64 %4, 14
  br i1 %cmp6.i, label %lor.lhs.false7.i, label %if.then13.i

lor.lhs.false7.i:                                 ; preds = %if.then5.i
  %5 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay8.i, x86_fp80
  %cmp9.i = fcmp une x86_fp80 %6, 0xK40068300000000000000
  br i1 %cmp9.i, label %if.then13.i, label %lor.lhs.false10.i

lor.lhs.false10.i:                                ; preds = %lor.lhs.false7.i
  %7 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %7, i64 0, i64 0
  %8 = va_arg %struct.__va_list_tag* %arraydecay11.i, i32
  %cmp12.i = icmp eq i32 %8, 17
  br i1 %cmp12.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false10.i, %lor.lhs.false7.i, %if.then5.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i, %lor.lhs.false10.i
  store i32 %conv, i32* @bar_arg, align 4, !tbaa !0
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %10 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %11 = va_arg %struct.__va_list_tag* %arraydecay, i64
  store i64 %11, i64* @x, align 8, !tbaa !5
  %conv5 = trunc i64 %11 to i32
  switch i32 %conv5, label %bar.exit23 [
    i32 16390, label %if.then.i9
    i32 16392, label %if.then5.i15
  ]

if.then.i9:                                       ; preds = %bar.exit
  %12 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i8 = fcmp une double %12, 1.700000e+01
  br i1 %cmp1.i8, label %if.then3.i12, label %lor.lhs.false.i11

lor.lhs.false.i11:                                ; preds = %if.then.i9
  %13 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i10 = icmp eq i64 %13, 129
  br i1 %cmp2.i10, label %bar.exit23, label %if.then3.i12

if.then3.i12:                                     ; preds = %lor.lhs.false.i11, %if.then.i9
  call void @abort() noreturn nounwind
  unreachable

if.then5.i15:                                     ; preds = %bar.exit
  %14 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay.i13 = getelementptr inbounds [1 x %struct.__va_list_tag]* %14, i64 0, i64 0
  %15 = va_arg %struct.__va_list_tag* %arraydecay.i13, i64
  %cmp6.i14 = icmp eq i64 %15, 14
  br i1 %cmp6.i14, label %lor.lhs.false7.i18, label %if.then13.i22

lor.lhs.false7.i18:                               ; preds = %if.then5.i15
  %16 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay8.i16 = getelementptr inbounds [1 x %struct.__va_list_tag]* %16, i64 0, i64 0
  %17 = va_arg %struct.__va_list_tag* %arraydecay8.i16, x86_fp80
  %cmp9.i17 = fcmp une x86_fp80 %17, 0xK40068300000000000000
  br i1 %cmp9.i17, label %if.then13.i22, label %lor.lhs.false10.i21

lor.lhs.false10.i21:                              ; preds = %lor.lhs.false7.i18
  %18 = load [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  %arraydecay11.i19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %18, i64 0, i64 0
  %19 = va_arg %struct.__va_list_tag* %arraydecay11.i19, i32
  %cmp12.i20 = icmp eq i32 %19, 17
  br i1 %cmp12.i20, label %bar.exit23, label %if.then13.i22

if.then13.i22:                                    ; preds = %lor.lhs.false10.i21, %lor.lhs.false7.i18, %if.then5.i15
  call void @abort() noreturn nounwind
  unreachable

bar.exit23:                                       ; preds = %bar.exit, %lor.lhs.false.i11, %lor.lhs.false10.i21
  store i32 %conv5, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  switch i32 %i, label %bar.exit [
    i32 16390, label %if.then.i
    i32 16392, label %if.then5.i
  ]

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i = fcmp une double %0, 1.700000e+01
  br i1 %cmp1.i, label %if.then3.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i = icmp eq i64 %1, 129
  br i1 %cmp2.i, label %bar.exit, label %if.then3.i

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

if.then5.i:                                       ; preds = %entry
  %arraydecay.i = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay.i, i64
  %cmp6.i = icmp eq i64 %2, 14
  br i1 %cmp6.i, label %lor.lhs.false7.i, label %if.then13.i

lor.lhs.false7.i:                                 ; preds = %if.then5.i
  %3 = va_arg %struct.__va_list_tag* %arraydecay.i, x86_fp80
  %cmp9.i = fcmp une x86_fp80 %3, 0xK40068300000000000000
  br i1 %cmp9.i, label %if.then13.i, label %lor.lhs.false10.i

lor.lhs.false10.i:                                ; preds = %lor.lhs.false7.i
  %4 = va_arg %struct.__va_list_tag* %arraydecay.i, i32
  %cmp12.i = icmp eq i32 %4, 17
  br i1 %cmp12.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false10.i, %lor.lhs.false7.i, %if.then5.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i, %lor.lhs.false10.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store [1 x %struct.__va_list_tag]* %ap, [1 x %struct.__va_list_tag]** @pap, align 8, !tbaa !3
  switch i32 %i, label %bar.exit [
    i32 16390, label %if.then.i
    i32 16392, label %if.then5.i
  ]

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp1.i = fcmp une double %0, 1.700000e+01
  br i1 %cmp1.i, label %if.then3.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  %cmp2.i = icmp eq i64 %1, 129
  br i1 %cmp2.i, label %bar.exit, label %if.then3.i

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

if.then5.i:                                       ; preds = %entry
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp6.i = icmp eq i64 %2, 14
  br i1 %cmp6.i, label %lor.lhs.false7.i, label %if.then13.i

lor.lhs.false7.i:                                 ; preds = %if.then5.i
  %3 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %cmp9.i = fcmp une x86_fp80 %3, 0xK40068300000000000000
  br i1 %cmp9.i, label %if.then13.i, label %lor.lhs.false10.i

lor.lhs.false10.i:                                ; preds = %lor.lhs.false7.i
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp12.i = icmp eq i32 %4, 17
  br i1 %cmp12.i, label %bar.exit, label %if.then13.i

if.then13.i:                                      ; preds = %lor.lhs.false10.i, %lor.lhs.false7.i, %if.then5.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i, %lor.lhs.false10.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  %5 = va_arg %struct.__va_list_tag* %arraydecay, double
  store double %5, double* @d, align 8, !tbaa !4
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 undef)
  store double 3.100000e+01, double* @d, align 8, !tbaa !4
  tail call void (i32, ...)* @f2(i32 undef, i64 28)
  %0 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp = icmp ne i32 %0, 28
  %1 = load i64* @x, align 8, !tbaa !5
  %cmp1 = icmp ne i64 %1, 28
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f3(i32 undef, double 1.310000e+02)
  %2 = load double* @d, align 8, !tbaa !4
  %cmp2 = fcmp une double %2, 1.310000e+02
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  tail call void (i32, ...)* @f4(i32 5, double 1.600000e+01, i32 128)
  %3 = load i64* @x, align 8, !tbaa !5
  %cmp5 = icmp ne i64 %3, 16
  %4 = load i32* @foo_arg, align 4, !tbaa !0
  %cmp7 = icmp ne i32 %4, 128
  %or.cond24 = or i1 %cmp5, %cmp7
  br i1 %or.cond24, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end4
  tail call void (i32, ...)* @f5(i32 16390, double 1.700000e+01, i64 129)
  %5 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp10 = icmp eq i32 %5, 16390
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end9
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  tail call void (i32, ...)* @f6(i32 undef, i64 12, i64 14, i64 -31)
  %6 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp13 = icmp eq i32 %6, -31
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  tail call void (i32, ...)* @f7(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.600000e+01)
  %7 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp16 = icmp eq i32 %7, 16392
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  tail call void (i32, ...)* @f8(i32 16392, i64 14, x86_fp80 0xK40068300000000000000, i32 17, double 2.700000e+01)
  %8 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp19 = icmp ne i32 %8, 16392
  %9 = load double* @d, align 8, !tbaa !4
  %cmp21 = fcmp une double %9, 2.700000e+01
  %or.cond25 = or i1 %cmp19, %cmp21
  br i1 %or.cond25, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end18
  tail call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end18
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"double", metadata !1}
!5 = metadata !{metadata !"long", metadata !1}
