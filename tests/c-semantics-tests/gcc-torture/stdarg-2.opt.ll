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

define void @foo(i32 %v, %struct.__va_list_tag* nocapture %ap) nounwind uwtable {
entry:
  switch i32 %v, label %sw.default [
    i32 5, label %sw.bb
    i32 8, label %sw.bb5
    i32 11, label %sw.bb10
  ]

sw.bb:                                            ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %ap, i32
  store i32 %0, i32* @foo_arg, align 4, !tbaa !0
  %1 = va_arg %struct.__va_list_tag* %ap, double
  %2 = load i32* @foo_arg, align 4, !tbaa !0
  %conv = sitofp i32 %2 to double
  %add = fadd double %conv, %1
  %conv1 = fptosi double %add to i32
  store i32 %conv1, i32* @foo_arg, align 4, !tbaa !0
  %3 = va_arg %struct.__va_list_tag* %ap, i64
  %4 = load i32* @foo_arg, align 4, !tbaa !0
  %conv214 = zext i32 %4 to i64
  %add3 = add nsw i64 %conv214, %3
  %conv4 = trunc i64 %add3 to i32
  store i32 %conv4, i32* @foo_arg, align 4, !tbaa !0
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %5 = va_arg %struct.__va_list_tag* %ap, i64
  %conv6 = trunc i64 %5 to i32
  store i32 %conv6, i32* @foo_arg, align 4, !tbaa !0
  %6 = va_arg %struct.__va_list_tag* %ap, double
  %7 = load i32* @foo_arg, align 4, !tbaa !0
  %conv7 = sitofp i32 %7 to double
  %add8 = fadd double %conv7, %6
  %conv9 = fptosi double %add8 to i32
  store i32 %conv9, i32* @foo_arg, align 4, !tbaa !0
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %8 = va_arg %struct.__va_list_tag* %ap, i32
  store i32 %8, i32* @foo_arg, align 4, !tbaa !0
  %9 = va_arg %struct.__va_list_tag* %ap, x86_fp80
  %10 = load i32* @foo_arg, align 4, !tbaa !0
  %conv11 = sitofp i32 %10 to x86_fp80
  %add12 = fadd x86_fp80 %conv11, %9
  %conv13 = fptosi x86_fp80 %add12 to i32
  store i32 %conv13, i32* @foo_arg, align 4, !tbaa !0
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb10, %sw.bb5, %sw.bb
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i32 %v) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %v, 16386
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i32
  %cmp1 = icmp eq i32 %0, 13
  br i1 %cmp1, label %lor.lhs.false, label %if.then3

lor.lhs.false:                                    ; preds = %if.then
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp2 = fcmp une double %1, -1.400000e+01
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.then, %lor.lhs.false
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %lor.lhs.false, %entry
  store i32 %v, i32* @bar_arg, align 4, !tbaa !0
  ret void
}

define void @f1(i32 %i, ...) nounwind uwtable {
entry:
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i64
  store i64 %0, i64* @x, align 8, !tbaa !3
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define void @f2(i32 %i, ...) nounwind uwtable {
entry:
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i32
  %cmp1.i = icmp eq i32 %0, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then3.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp2.i = fcmp une double %1, -1.400000e+01
  br i1 %cmp2.i, label %if.then3.i, label %bar.exit

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @gap to i8*))
  ret void
}

define void @f3(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i64
  store i64 %0, i64* @x, align 8, !tbaa !3
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f4(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i32
  %cmp1.i = icmp eq i32 %0, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then3.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp2.i = fcmp une double %1, -1.400000e+01
  br i1 %cmp2.i, label %if.then3.i, label %bar.exit

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f5(i32 %i, ...) nounwind uwtable {
entry:
  %aps = alloca [10 x [1 x %struct.__va_list_tag]], align 16
  %arraydecay = getelementptr inbounds [10 x [1 x %struct.__va_list_tag]]* %aps, i64 0, i64 4, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default.i [
    i32 5, label %sw.bb.i
    i32 8, label %sw.bb5.i
    i32 11, label %sw.bb10.i
  ]

sw.bb.i:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i = sitofp i32 %0 to double
  %add.i = fadd double %conv.i, %1
  %conv1.i = fptosi double %add.i to i32
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv214.i = zext i32 %conv1.i to i64
  %add3.i = add nsw i64 %conv214.i, %2
  %conv4.i = trunc i64 %add3.i to i32
  store i32 %conv4.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb5.i:                                         ; preds = %entry
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv6.i = trunc i64 %3 to i32
  %4 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv7.i = sitofp i32 %conv6.i to double
  %add8.i = fadd double %conv7.i, %4
  %conv9.i = fptosi double %add8.i to i32
  store i32 %conv9.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb10.i:                                        ; preds = %entry
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %6 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %conv11.i = sitofp i32 %5 to x86_fp80
  %add12.i = fadd x86_fp80 %conv11.i, %6
  %conv13.i = fptosi x86_fp80 %add12.i to i32
  store i32 %conv13.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %sw.bb.i, %sw.bb5.i, %sw.bb10.i
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f6(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i64
  store i64 %0, i64* @x, align 8, !tbaa !3
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f7(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i32
  %cmp1.i = icmp eq i32 %0, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then3.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp2.i = fcmp une double %1, -1.400000e+01
  br i1 %cmp2.i, label %if.then3.i, label %bar.exit

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f8(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default.i [
    i32 5, label %sw.bb.i
    i32 8, label %sw.bb5.i
    i32 11, label %sw.bb10.i
  ]

sw.bb.i:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i = sitofp i32 %0 to double
  %add.i = fadd double %conv.i, %1
  %conv1.i = fptosi double %add.i to i32
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv214.i = zext i32 %conv1.i to i64
  %add3.i = add nsw i64 %conv214.i, %2
  %conv4.i = trunc i64 %add3.i to i32
  store i32 %conv4.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb5.i:                                         ; preds = %entry
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv6.i = trunc i64 %3 to i32
  %4 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv7.i = sitofp i32 %conv6.i to double
  %add8.i = fadd double %conv7.i, %4
  %conv9.i = fptosi double %add8.i to i32
  store i32 %conv9.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb10.i:                                        ; preds = %entry
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %6 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %conv11.i = sitofp i32 %5 to x86_fp80
  %add12.i = fadd x86_fp80 %conv11.i, %6
  %conv13.i = fptosi x86_fp80 %add12.i to i32
  store i32 %conv13.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %sw.bb.i, %sw.bb5.i, %sw.bb10.i
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f10(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i64
  store i64 %0, i64* @x, align 8, !tbaa !3
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f11(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %cmp.i = icmp eq i32 %i, 16386
  br i1 %cmp.i, label %if.then.i, label %bar.exit

if.then.i:                                        ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), i32
  %cmp1.i = icmp eq i32 %0, 13
  br i1 %cmp1.i, label %lor.lhs.false.i, label %if.then3.i

lor.lhs.false.i:                                  ; preds = %if.then.i
  %1 = va_arg %struct.__va_list_tag* getelementptr inbounds ([1 x %struct.__va_list_tag]* @gap, i64 0, i64 0), double
  %cmp2.i = fcmp une double %1, -1.400000e+01
  br i1 %cmp2.i, label %if.then3.i, label %bar.exit

if.then3.i:                                       ; preds = %lor.lhs.false.i, %if.then.i
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry, %lor.lhs.false.i
  store i32 %i, i32* @bar_arg, align 4, !tbaa !0
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define void @f12(i32 %i, ...) nounwind uwtable {
entry:
  %a = alloca %struct.A, align 8
  %arraydecay = getelementptr inbounds %struct.A* %a, i64 0, i32 2, i64 1, i64 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  switch i32 %i, label %sw.default.i [
    i32 5, label %sw.bb.i
    i32 8, label %sw.bb5.i
    i32 11, label %sw.bb10.i
  ]

sw.bb.i:                                          ; preds = %entry
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %1 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv.i = sitofp i32 %0 to double
  %add.i = fadd double %conv.i, %1
  %conv1.i = fptosi double %add.i to i32
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv214.i = zext i32 %conv1.i to i64
  %add3.i = add nsw i64 %conv214.i, %2
  %conv4.i = trunc i64 %add3.i to i32
  store i32 %conv4.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb5.i:                                         ; preds = %entry
  %3 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %conv6.i = trunc i64 %3 to i32
  %4 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv7.i = sitofp i32 %conv6.i to double
  %add8.i = fadd double %conv7.i, %4
  %conv9.i = fptosi double %add8.i to i32
  store i32 %conv9.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.bb10.i:                                        ; preds = %entry
  %5 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %6 = va_arg %struct.__va_list_tag* %arraydecay, x86_fp80
  %conv11.i = sitofp i32 %5 to x86_fp80
  %add12.i = fadd x86_fp80 %conv11.i, %6
  %conv13.i = fptosi x86_fp80 %add12.i to i32
  store i32 %conv13.i, i32* @foo_arg, align 4, !tbaa !0
  br label %foo.exit

sw.default.i:                                     ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %sw.bb.i, %sw.bb5.i, %sw.bb10.i
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void (i32, ...)* @f1(i32 undef, i64 79)
  %0 = load i64* @x, align 8, !tbaa !3
  %cmp = icmp eq i64 %0, 79
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void (i32, ...)* @f2(i32 16386, i32 13, double -1.400000e+01)
  %1 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %1, 16386
  br i1 %cmp1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  tail call void (i32, ...)* @f3(i32 undef, i64 2031)
  %2 = load i64* @x, align 8, !tbaa !3
  %cmp4 = icmp eq i64 %2, 2031
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end3
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  tail call void (i32, ...)* @f4(i32 4, i32 18)
  %3 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp7 = icmp eq i32 %3, 4
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  tail call void (i32, ...)* @f5(i32 5, i32 1, double 1.900000e+01, i64 18)
  %4 = load i32* @foo_arg, align 4, !tbaa !0
  %cmp10 = icmp eq i32 %4, 38
  br i1 %cmp10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end9
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end9
  tail call void (i32, ...)* @f6(i32 undef, i64 18)
  %5 = load i64* @x, align 8, !tbaa !3
  %cmp13 = icmp eq i64 %5, 18
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end12
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end12
  tail call void (i32, ...)* @f7(i32 7)
  %6 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp16 = icmp eq i32 %6, 7
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  tail call void (i32, ...)* @f8(i32 8, i64 2031, double 1.300000e+01)
  %7 = load i32* @foo_arg, align 4, !tbaa !0
  %cmp19 = icmp eq i32 %7, 2044
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end18
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end18
  tail call void (i32, ...)* @f10(i32 undef, i64 180)
  %8 = load i64* @x, align 8, !tbaa !3
  %cmp22 = icmp eq i64 %8, 180
  br i1 %cmp22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end21
  tail call void (i32, ...)* @f11(i32 10)
  %9 = load i32* @bar_arg, align 4, !tbaa !0
  %cmp25 = icmp eq i32 %9, 10
  br i1 %cmp25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end24
  tail call void (i32, ...)* @f12(i32 11, i32 2030, x86_fp80 0xK4002C000000000000000)
  %10 = load i32* @foo_arg, align 4, !tbaa !0
  %cmp28 = icmp eq i32 %10, 2042
  br i1 %cmp28, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end27
  tail call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end27
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long", metadata !1}
