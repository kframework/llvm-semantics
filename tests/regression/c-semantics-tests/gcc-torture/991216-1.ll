; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test1(i32 %a, i64 %value, i32 %after) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %value.addr = alloca i64, align 8
  %after.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i64 %value, i64* %value.addr, align 8
  store i32 %after, i32* %after.addr, align 4
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %value.addr, align 8
  %cmp1 = icmp ne i64 %1, 81985529216486895
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %after.addr, align 4
  %cmp3 = icmp ne i32 %2, 85
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i64* %value.addr, align 8
  %cmp3 = icmp ne i64 %2, 81985529216486895
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %after.addr, align 4
  %cmp5 = icmp ne i32 %3, 85
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i64* %value.addr, align 8
  %cmp5 = icmp ne i64 %3, 81985529216486895
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32* %after.addr, align 4
  %cmp7 = icmp ne i32 %4, 85
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %d.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i64* %value.addr, align 8
  %cmp7 = icmp ne i64 %4, 81985529216486895
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i32* %after.addr, align 4
  %cmp9 = icmp ne i32 %5, 85
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false8
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %d.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32* %e.addr, align 4
  %cmp7 = icmp ne i32 %4, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i64* %value.addr, align 8
  %cmp9 = icmp ne i64 %5, 81985529216486895
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %6 = load i32* %after.addr, align 4
  %cmp11 = icmp ne i32 %6, 85
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false10
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %d.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32* %e.addr, align 4
  %cmp7 = icmp ne i32 %4, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i32* %f.addr, align 4
  %cmp9 = icmp ne i32 %5, 6
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %6 = load i64* %value.addr, align 8
  %cmp11 = icmp ne i64 %6, 81985529216486895
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false10
  %7 = load i32* %after.addr, align 4
  %cmp13 = icmp ne i32 %7, 85
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false12, %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false12
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %d.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32* %e.addr, align 4
  %cmp7 = icmp ne i32 %4, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i32* %f.addr, align 4
  %cmp9 = icmp ne i32 %5, 6
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %6 = load i32* %g.addr, align 4
  %cmp11 = icmp ne i32 %6, 7
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false10
  %7 = load i64* %value.addr, align 8
  %cmp13 = icmp ne i64 %7, 81985529216486895
  br i1 %cmp13, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %8 = load i32* %after.addr, align 4
  %cmp15 = icmp ne i32 %8, 85
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false14
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
  %0 = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %c.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %d.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32* %e.addr, align 4
  %cmp7 = icmp ne i32 %4, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %5 = load i32* %f.addr, align 4
  %cmp9 = icmp ne i32 %5, 6
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %6 = load i32* %g.addr, align 4
  %cmp11 = icmp ne i32 %6, 7
  br i1 %cmp11, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false10
  %7 = load i32* %h.addr, align 4
  %cmp13 = icmp ne i32 %7, 8
  br i1 %cmp13, label %if.then, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false12
  %8 = load i64* %value.addr, align 8
  %cmp15 = icmp ne i64 %8, 81985529216486895
  br i1 %cmp15, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false14
  %9 = load i32* %after.addr, align 4
  %cmp17 = icmp ne i32 %9, 85
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false16, %lor.lhs.false14, %lor.lhs.false12, %lor.lhs.false10, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false16
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
