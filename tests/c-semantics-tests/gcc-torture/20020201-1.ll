; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cx = global i8 7, align 1
@sx = global i16 14, align 2
@ix = global i32 21, align 4
@lx = global i64 28, align 8
@Lx = global i64 35, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %cy = alloca i8, align 1
  %sy = alloca i16, align 2
  %iy = alloca i32, align 4
  %ly = alloca i64, align 8
  %Ly = alloca i64, align 8
  store i32 0, i32* %retval
  %0 = load i8* @cx, align 1
  %conv = zext i8 %0 to i32
  %div = sdiv i32 %conv, 6
  %conv1 = trunc i32 %div to i8
  store i8 %conv1, i8* %cy, align 1
  %1 = load i8* %cy, align 1
  %conv2 = zext i8 %1 to i32
  %cmp = icmp ne i32 %conv2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8* @cx, align 1
  %conv4 = zext i8 %2 to i32
  %rem = srem i32 %conv4, 6
  %conv5 = trunc i32 %rem to i8
  store i8 %conv5, i8* %cy, align 1
  %3 = load i8* %cy, align 1
  %conv6 = zext i8 %3 to i32
  %cmp7 = icmp ne i32 %conv6, 1
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end10:                                         ; preds = %if.end
  %4 = load i16* @sx, align 2
  %conv11 = zext i16 %4 to i32
  %div12 = sdiv i32 %conv11, 6
  %conv13 = trunc i32 %div12 to i16
  store i16 %conv13, i16* %sy, align 2
  %5 = load i16* %sy, align 2
  %conv14 = zext i16 %5 to i32
  %cmp15 = icmp ne i32 %conv14, 2
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end10
  call void @abort() noreturn
  unreachable

if.end18:                                         ; preds = %if.end10
  %6 = load i16* @sx, align 2
  %conv19 = zext i16 %6 to i32
  %rem20 = srem i32 %conv19, 6
  %conv21 = trunc i32 %rem20 to i16
  store i16 %conv21, i16* %sy, align 2
  %7 = load i16* %sy, align 2
  %conv22 = zext i16 %7 to i32
  %cmp23 = icmp ne i32 %conv22, 2
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end18
  call void @abort() noreturn
  unreachable

if.end26:                                         ; preds = %if.end18
  %8 = load i32* @ix, align 4
  %div27 = udiv i32 %8, 6
  store i32 %div27, i32* %iy, align 4
  %9 = load i32* %iy, align 4
  %cmp28 = icmp ne i32 %9, 3
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  call void @abort() noreturn
  unreachable

if.end31:                                         ; preds = %if.end26
  %10 = load i32* @ix, align 4
  %rem32 = urem i32 %10, 6
  store i32 %rem32, i32* %iy, align 4
  %11 = load i32* %iy, align 4
  %cmp33 = icmp ne i32 %11, 3
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end31
  call void @abort() noreturn
  unreachable

if.end36:                                         ; preds = %if.end31
  %12 = load i64* @lx, align 8
  %div37 = udiv i64 %12, 6
  store i64 %div37, i64* %ly, align 8
  %13 = load i64* %ly, align 8
  %cmp38 = icmp ne i64 %13, 4
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  call void @abort() noreturn
  unreachable

if.end41:                                         ; preds = %if.end36
  %14 = load i64* @lx, align 8
  %rem42 = urem i64 %14, 6
  store i64 %rem42, i64* %ly, align 8
  %15 = load i64* %ly, align 8
  %cmp43 = icmp ne i64 %15, 4
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end41
  call void @abort() noreturn
  unreachable

if.end46:                                         ; preds = %if.end41
  %16 = load i64* @Lx, align 8
  %div47 = udiv i64 %16, 6
  store i64 %div47, i64* %Ly, align 8
  %17 = load i64* %Ly, align 8
  %cmp48 = icmp ne i64 %17, 5
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end46
  call void @abort() noreturn
  unreachable

if.end51:                                         ; preds = %if.end46
  %18 = load i64* @Lx, align 8
  %rem52 = urem i64 %18, 6
  store i64 %rem52, i64* %Ly, align 8
  %19 = load i64* %Ly, align 8
  %cmp53 = icmp ne i64 %19, 5
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end51
  call void @abort() noreturn
  unreachable

if.end56:                                         ; preds = %if.end51
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %20 = load i32* %retval
  ret i32 %20
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
