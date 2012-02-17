; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i8* @cx, align 1
  %conv = zext i8 %tmp to i32
  %div = sdiv i32 %conv, 6
  %conv1 = trunc i32 %div to i8
  store i8 %conv1, i8* %cy, align 1
  %tmp2 = load i8* %cy, align 1
  %conv3 = zext i8 %tmp2 to i32
  %cmp = icmp ne i32 %conv3, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp5 = load i8* @cx, align 1
  %conv6 = zext i8 %tmp5 to i32
  %rem = srem i32 %conv6, 6
  %conv7 = trunc i32 %rem to i8
  store i8 %conv7, i8* %cy, align 1
  %tmp8 = load i8* %cy, align 1
  %conv9 = zext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv9, 1
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end
  %tmp14 = load i16* @sx, align 2
  %conv15 = zext i16 %tmp14 to i32
  %div16 = sdiv i32 %conv15, 6
  %conv17 = trunc i32 %div16 to i16
  store i16 %conv17, i16* %sy, align 2
  %tmp18 = load i16* %sy, align 2
  %conv19 = zext i16 %tmp18 to i32
  %cmp20 = icmp ne i32 %conv19, 2
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end13
  call void @abort() noreturn
  unreachable

if.end23:                                         ; preds = %if.end13
  %tmp24 = load i16* @sx, align 2
  %conv25 = zext i16 %tmp24 to i32
  %rem26 = srem i32 %conv25, 6
  %conv27 = trunc i32 %rem26 to i16
  store i16 %conv27, i16* %sy, align 2
  %tmp28 = load i16* %sy, align 2
  %conv29 = zext i16 %tmp28 to i32
  %cmp30 = icmp ne i32 %conv29, 2
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end23
  call void @abort() noreturn
  unreachable

if.end33:                                         ; preds = %if.end23
  %tmp34 = load i32* @ix, align 4
  %div35 = udiv i32 %tmp34, 6
  store i32 %div35, i32* %iy, align 4
  %tmp36 = load i32* %iy, align 4
  %cmp37 = icmp ne i32 %tmp36, 3
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end33
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %if.end33
  %tmp41 = load i32* @ix, align 4
  %rem42 = urem i32 %tmp41, 6
  store i32 %rem42, i32* %iy, align 4
  %tmp43 = load i32* %iy, align 4
  %cmp44 = icmp ne i32 %tmp43, 3
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end40
  call void @abort() noreturn
  unreachable

if.end47:                                         ; preds = %if.end40
  %tmp48 = load i64* @lx, align 8
  %div49 = udiv i64 %tmp48, 6
  store i64 %div49, i64* %ly, align 8
  %tmp50 = load i64* %ly, align 8
  %cmp51 = icmp ne i64 %tmp50, 4
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end47
  call void @abort() noreturn
  unreachable

if.end54:                                         ; preds = %if.end47
  %tmp55 = load i64* @lx, align 8
  %rem56 = urem i64 %tmp55, 6
  store i64 %rem56, i64* %ly, align 8
  %tmp57 = load i64* %ly, align 8
  %cmp58 = icmp ne i64 %tmp57, 4
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end54
  call void @abort() noreturn
  unreachable

if.end61:                                         ; preds = %if.end54
  %tmp62 = load i64* @Lx, align 8
  %div63 = udiv i64 %tmp62, 6
  store i64 %div63, i64* %Ly, align 8
  %tmp64 = load i64* %Ly, align 8
  %cmp65 = icmp ne i64 %tmp64, 5
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end61
  call void @abort() noreturn
  unreachable

if.end68:                                         ; preds = %if.end61
  %tmp69 = load i64* @Lx, align 8
  %rem70 = urem i64 %tmp69, 6
  store i64 %rem70, i64* %Ly, align 8
  %tmp71 = load i64* %Ly, align 8
  %cmp72 = icmp ne i64 %tmp71, 5
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end68
  call void @abort() noreturn
  unreachable

if.end75:                                         ; preds = %if.end68
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
