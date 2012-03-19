; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define void @test1(i32 %a, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i64* %value.addr, align 8
  %cmp2 = icmp ne i64 %tmp1, 81985529216486895
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %after.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 85
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i32 %a, i32 %b, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i64* %value.addr, align 8
  %cmp5 = icmp ne i64 %tmp4, 81985529216486895
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %after.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 85
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  ret void
}

define void @test3(i32 %a, i32 %b, i32 %c, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i64* %value.addr, align 8
  %cmp8 = icmp ne i64 %tmp7, 81985529216486895
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32* %after.addr, align 4
  %cmp11 = icmp ne i32 %tmp10, 85
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false9
  ret void
}

define void @test4(i32 %a, i32 %b, i32 %c, i32 %d, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %d.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 4
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i64* %value.addr, align 8
  %cmp11 = icmp ne i64 %tmp10, 81985529216486895
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i32* %after.addr, align 4
  %cmp14 = icmp ne i32 %tmp13, 85
  br i1 %cmp14, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
  ret void
}

define void @test5(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %d.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 4
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32* %e.addr, align 4
  %cmp11 = icmp ne i32 %tmp10, 5
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i64* %value.addr, align 8
  %cmp14 = icmp ne i64 %tmp13, 81985529216486895
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false12
  %tmp16 = load i32* %after.addr, align 4
  %cmp17 = icmp ne i32 %tmp16, 85
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false15, %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false15
  ret void
}

define void @test6(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %d.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 4
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32* %e.addr, align 4
  %cmp11 = icmp ne i32 %tmp10, 5
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i32* %f.addr, align 4
  %cmp14 = icmp ne i32 %tmp13, 6
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false12
  %tmp16 = load i64* %value.addr, align 8
  %cmp17 = icmp ne i64 %tmp16, 81985529216486895
  br i1 %cmp17, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false15
  %tmp19 = load i32* %after.addr, align 4
  %cmp20 = icmp ne i32 %tmp19, 85
  br i1 %cmp20, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false18, %lor.lhs.false15, %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false18
  ret void
}

define void @test7(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %d.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 4
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32* %e.addr, align 4
  %cmp11 = icmp ne i32 %tmp10, 5
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i32* %f.addr, align 4
  %cmp14 = icmp ne i32 %tmp13, 6
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false12
  %tmp16 = load i32* %g.addr, align 4
  %cmp17 = icmp ne i32 %tmp16, 7
  br i1 %cmp17, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false15
  %tmp19 = load i64* %value.addr, align 8
  %cmp20 = icmp ne i64 %tmp19, 81985529216486895
  br i1 %cmp20, label %if.then, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false18
  %tmp22 = load i32* %after.addr, align 4
  %cmp23 = icmp ne i32 %tmp22, 85
  br i1 %cmp23, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false21, %lor.lhs.false18, %lor.lhs.false15, %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false21
  ret void
}

define void @test8(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp1 = load i32* %b.addr, align 4
  %cmp2 = icmp ne i32 %tmp1, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %tmp4 = load i32* %c.addr, align 4
  %cmp5 = icmp ne i32 %tmp4, 3
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %tmp7 = load i32* %d.addr, align 4
  %cmp8 = icmp ne i32 %tmp7, 4
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false6
  %tmp10 = load i32* %e.addr, align 4
  %cmp11 = icmp ne i32 %tmp10, 5
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false9
  %tmp13 = load i32* %f.addr, align 4
  %cmp14 = icmp ne i32 %tmp13, 6
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false12
  %tmp16 = load i32* %g.addr, align 4
  %cmp17 = icmp ne i32 %tmp16, 7
  br i1 %cmp17, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false15
  %tmp19 = load i32* %h.addr, align 4
  %cmp20 = icmp ne i32 %tmp19, 8
  br i1 %cmp20, label %if.then, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false18
  %tmp22 = load i64* %value.addr, align 8
  %cmp23 = icmp ne i64 %tmp22, 81985529216486895
  br i1 %cmp23, label %if.then, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false21
  %tmp25 = load i32* %after.addr, align 4
  %cmp26 = icmp ne i32 %tmp25, 85
  br i1 %cmp26, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false24, %lor.lhs.false21, %lor.lhs.false18, %lor.lhs.false15, %lor.lhs.false12, %lor.lhs.false9, %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false24
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1(i32 1, i64 81985529216486895, i32 85)
  call void @test2(i32 1, i32 2, i64 81985529216486895, i32 85)
  call void @test3(i32 1, i32 2, i32 3, i64 81985529216486895, i32 85)
  call void @test4(i32 1, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  call void @test5(i32 1, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  call void @test6(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  call void @test7(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  call void @test8(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
