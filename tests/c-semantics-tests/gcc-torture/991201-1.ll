; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vc_data = type { i64, [48 x i8] }
%struct.vc = type { %struct.vc_data* }

@a_con = common global %struct.vc_data zeroinitializer, align 8
@vc_cons = global [63 x %struct.vc] [%struct.vc { %struct.vc_data* @a_con }, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer], align 16
@default_red = common global [16 x i32] zeroinitializer, align 16
@default_grn = common global [16 x i32] zeroinitializer, align 16
@default_blu = common global [16 x i32] zeroinitializer, align 16

define void @reset_palette(i32 %currcons) nounwind uwtable {
entry:
  %currcons.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %currcons, i32* %currcons.addr, align 4
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %j, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [16 x i32]* @default_red, i32 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  %conv = trunc i32 %2 to i8
  %3 = load i32* %k, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %k, align 4
  %idxprom1 = sext i32 %3 to i64
  %4 = load i32* %currcons.addr, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom2
  %d = getelementptr inbounds %struct.vc* %arrayidx3, i32 0, i32 0
  %5 = load %struct.vc_data** %d, align 8
  %vc_palette = getelementptr inbounds %struct.vc_data* %5, i32 0, i32 1
  %arrayidx4 = getelementptr inbounds [48 x i8]* %vc_palette, i32 0, i64 %idxprom1
  store i8 %conv, i8* %arrayidx4, align 1
  %6 = load i32* %j, align 4
  %idxprom5 = sext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds [16 x i32]* @default_grn, i32 0, i64 %idxprom5
  %7 = load i32* %arrayidx6, align 4
  %conv7 = trunc i32 %7 to i8
  %8 = load i32* %k, align 4
  %inc8 = add nsw i32 %8, 1
  store i32 %inc8, i32* %k, align 4
  %idxprom9 = sext i32 %8 to i64
  %9 = load i32* %currcons.addr, align 4
  %idxprom10 = sext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom10
  %d12 = getelementptr inbounds %struct.vc* %arrayidx11, i32 0, i32 0
  %10 = load %struct.vc_data** %d12, align 8
  %vc_palette13 = getelementptr inbounds %struct.vc_data* %10, i32 0, i32 1
  %arrayidx14 = getelementptr inbounds [48 x i8]* %vc_palette13, i32 0, i64 %idxprom9
  store i8 %conv7, i8* %arrayidx14, align 1
  %11 = load i32* %j, align 4
  %idxprom15 = sext i32 %11 to i64
  %arrayidx16 = getelementptr inbounds [16 x i32]* @default_blu, i32 0, i64 %idxprom15
  %12 = load i32* %arrayidx16, align 4
  %conv17 = trunc i32 %12 to i8
  %13 = load i32* %k, align 4
  %inc18 = add nsw i32 %13, 1
  store i32 %inc18, i32* %k, align 4
  %idxprom19 = sext i32 %13 to i64
  %14 = load i32* %currcons.addr, align 4
  %idxprom20 = sext i32 %14 to i64
  %arrayidx21 = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i32 0, i64 %idxprom20
  %d22 = getelementptr inbounds %struct.vc* %arrayidx21, i32 0, i32 0
  %15 = load %struct.vc_data** %d22, align 8
  %vc_palette23 = getelementptr inbounds %struct.vc_data* %15, i32 0, i32 1
  %arrayidx24 = getelementptr inbounds [48 x i8]* %vc_palette23, i32 0, i64 %idxprom19
  store i8 %conv17, i8* %arrayidx24, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32* %j, align 4
  %inc25 = add nsw i32 %16, 1
  store i32 %inc25, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i32* %k, align 4
  call void @bar(i32 %17)
  ret void
}

define void @bar(i32 %k) nounwind uwtable {
entry:
  %k.addr = alloca i32, align 4
  store i32 %k, i32* %k.addr, align 4
  %0 = load i32* %k.addr, align 4
  %cmp = icmp ne i32 %0, 48
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
  store i32 0, i32* %retval
  call void @reset_palette(i32 0)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
