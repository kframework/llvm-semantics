; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/stdarg-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@y = common global i64 0, align 8
@x = common global i64 0, align 8

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i = fptosi double %0 to i64
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i = add nsw i64 %conv.i, %1
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv1.i = sitofp i64 %add.i to double
  %add2.i = fadd double %conv1.i, %2
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @x, align 8, !tbaa !0
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
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %conv.i = sext i32 %0 to i64
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i = add nsw i64 %conv.i, %1
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv1.i = sitofp i64 %add.i to double
  %add2.i = fadd double %conv1.i, %2
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @y, align 8, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i.i = fptosi double %3 to i64
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i.i = add nsw i64 %conv.i.i, %4
  %5 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv1.i.i = sitofp i64 %add.i.i to double
  %add2.i.i = fadd double %conv1.i.i, %5
  %conv3.i.i = fptosi double %add2.i.i to i64
  store i64 %conv3.i.i, i64* @x, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i64 @f3h(i32 %i, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3) nounwind uwtable readnone {
entry:
  %conv = sext i32 %i to i64
  %add = add i64 %conv, %arg0
  %add1 = add i64 %add, %arg1
  %add2 = add i64 %add1, %arg2
  %add3 = add i64 %add2, %arg3
  ret i64 %add3
}

define i64 @f3(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default [
    i32 0, label %sw.epilog
    i32 1, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb9
    i32 4, label %sw.bb14
  ]

sw.bb2:                                           ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i31 = add i64 %0, 1
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i28 = add i64 %2, 2
  %add1.i29 = add i64 %add.i28, %1
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i24 = add i64 %5, 3
  %add1.i25 = add i64 %add.i24, %4
  %add2.i26 = add i64 %add1.i25, %3
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %6 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %7 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %8 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %9 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i = add i64 %9, 4
  %add1.i = add i64 %add.i, %8
  %add2.i = add i64 %add1.i, %7
  %add3.i = add i64 %add2.i, %6
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %entry, %sw.bb14, %sw.bb9, %sw.bb5, %sw.bb2
  %t.0 = phi i64 [ %add3.i, %sw.bb14 ], [ %add2.i26, %sw.bb9 ], [ %add1.i29, %sw.bb5 ], [ %add.i31, %sw.bb2 ], [ 0, %entry ]
  call void @llvm.va_end(i8* %arraydecay1)
  ret i64 %t.0
}

declare void @abort() noreturn nounwind

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default [
    i32 4, label %sw.bb
    i32 5, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv5 = fptosi double %1 to i64
  store i64 %conv5, i64* @y, align 8, !tbaa !0
  %2 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv7 = sitofp i64 %conv5 to double
  %add = fadd double %conv7, %2
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb
  %storemerge.in = phi double [ %add, %sw.bb3 ], [ %0, %sw.bb ]
  %storemerge = fptosi double %storemerge.in to i64
  store i64 %storemerge, i64* @y, align 8
  %3 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i = fptosi double %3 to i64
  %4 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %add.i = add nsw i64 %conv.i, %4
  %5 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv1.i = sitofp i64 %add.i to double
  %add2.i = fadd double %conv1.i, %5
  %conv3.i = fptosi double %add2.i to i64
  store i64 %conv3.i, i64* @x, align 8, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 undef, double 1.600000e+01, i64 128, double 3.200000e+01)
  %0 = load i64* @x, align 8, !tbaa !0
  %cmp = icmp eq i64 %0, 176
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f2(i32 undef, i32 5, i64 7, double 1.800000e+01, double 1.900000e+01, i64 17, double 6.400000e+01)
  %1 = load i64* @x, align 8, !tbaa !0
  %cmp1 = icmp ne i64 %1, 100
  %2 = load i64* @y, align 8, !tbaa !0
  %cmp2 = icmp ne i64 %2, 30
  %or.cond = or i1 %cmp1, %cmp2
  br i1 %or.cond, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call = tail call i64 (i32, ...)* @f3(i32 0)
  %cmp5 = icmp eq i64 %call, 0
  br i1 %cmp5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end4
  %call8 = tail call i64 (i32, ...)* @f3(i32 1, i64 18)
  %cmp9 = icmp eq i64 %call8, 19
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end7
  %call12 = tail call i64 (i32, ...)* @f3(i32 2, i64 18, i64 100)
  %cmp13 = icmp eq i64 %call12, 120
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end11
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %call16 = tail call i64 (i32, ...)* @f3(i32 3, i64 18, i64 100, i64 300)
  %cmp17 = icmp eq i64 %call16, 421
  br i1 %cmp17, label %if.end19, label %if.then18

if.then18:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end15
  %call20 = tail call i64 (i32, ...)* @f3(i32 4, i64 18, i64 71, i64 64, i64 86)
  %cmp21 = icmp eq i64 %call20, 243
  br i1 %cmp21, label %if.end23, label %if.then22

if.then22:                                        ; preds = %if.end19
  tail call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end19
  tail call void (i32, ...)* @f4(i32 4, double 6.000000e+00, double 9.000000e+00, i64 16, double 1.800000e+01)
  %3 = load i64* @x, align 8, !tbaa !0
  %cmp24 = icmp ne i64 %3, 43
  %4 = load i64* @y, align 8, !tbaa !0
  %cmp26 = icmp ne i64 %4, 6
  %or.cond34 = or i1 %cmp24, %cmp26
  br i1 %or.cond34, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end23
  tail call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end23
  tail call void (i32, ...)* @f4(i32 5, double 7.000000e+00, double 2.100000e+01, double 1.000000e+00, i64 17, double 1.260000e+02)
  %5 = load i64* @x, align 8, !tbaa !0
  %cmp29 = icmp ne i64 %5, 144
  %6 = load i64* @y, align 8, !tbaa !0
  %cmp31 = icmp ne i64 %6, 28
  %or.cond35 = or i1 %cmp29, %cmp31
  br i1 %or.cond35, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end28
  tail call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end28
  ret i32 0
}

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
