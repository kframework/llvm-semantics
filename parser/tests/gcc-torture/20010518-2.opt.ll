; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010518-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type <{ i16, i64, i16, i16, %struct.b_struct }>
%struct.b_struct = type <{ i8, i8, i8, i8, i8, i8 }>

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %b = alloca %struct.a_struct, align 2
  %b.0 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 0
  store i16 1, i16* %b.0, align 2
  %b.1 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 1
  store i64 2, i64* %b.1, align 2
  %b.2 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 2
  store i16 3, i16* %b.2, align 2
  %b.3 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 3
  store i16 4, i16* %b.3, align 2
  %b.4.0 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 0
  store i8 0, i8* %b.4.0, align 2
  %b.4.1 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 1
  store i8 0, i8* %b.4.1, align 1
  %b.4.2 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 2
  store i8 0, i8* %b.4.2, align 2
  %b.4.3 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 3
  store i8 0, i8* %b.4.3, align 1
  %b.4.4 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 4
  %b.4.5 = getelementptr inbounds %struct.a_struct* %b, i64 0, i32 4, i32 5
  store i8 0, i8* %b.4.5, align 1
  volatile store i8 99, i8* %b.4.4, align 2
  %tmp10 = volatile load i16* %b.0, align 2
  %cmp = icmp eq i16 %tmp10, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %tmp14 = volatile load i64* %b.1, align 2
  %cmp15 = icmp eq i64 %tmp14, 2
  br i1 %cmp15, label %lor.lhs.false17, label %if.then

lor.lhs.false17:                                  ; preds = %lor.lhs.false
  %tmp20 = volatile load i16* %b.2, align 2
  %cmp22 = icmp eq i16 %tmp20, 3
  br i1 %cmp22, label %lor.lhs.false24, label %if.then

lor.lhs.false24:                                  ; preds = %lor.lhs.false17
  %tmp27 = volatile load i16* %b.3, align 2
  %cmp29 = icmp eq i16 %tmp27, 4
  br i1 %cmp29, label %lor.lhs.false31, label %if.then

lor.lhs.false31:                                  ; preds = %lor.lhs.false24
  %tmp35 = volatile load i8* %b.4.4, align 2
  %cmp37 = icmp eq i8 %tmp35, 99
  br i1 %cmp37, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false31, %lor.lhs.false24, %lor.lhs.false17, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false31
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
