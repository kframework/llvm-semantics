; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001130-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@which_alternative = internal global i32 3, align 4
@.str = private unnamed_addr constant [10 x i8] c"mov\09%1,%0\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"ld\09%1,%0\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"st\09%1,%0\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"foo\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call i8* @output_25()
  store i8* %call, i8** %s, align 8
  %tmp = load i8** %s, align 8
  %arrayidx = getelementptr inbounds i8* %tmp, i64 0
  %tmp1 = load i8* %arrayidx
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp ne i32 %conv, 115
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i8* @output_25() nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %tmp = load i32* @which_alternative, align 4
  switch i32 %tmp, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
    i32 3, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  store i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8** %retval
  br label %return

sw.bb1:                                           ; preds = %entry
  %call = call i8* @i960_output_ldconst()
  store i8* %call, i8** %retval
  br label %return

sw.bb2:                                           ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8** %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  store i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i8** %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i8* null, i8** %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %0 = load i8** %retval
  ret i8* %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i8* @i960_output_ldconst() nounwind uwtable {
entry:
  ret i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0)
}
